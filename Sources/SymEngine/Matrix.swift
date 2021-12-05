import CSymEngine


public class Matrix: ExpressibleByArrayLiteral {
    
    // Stores the pointer to the matrix object in memory
    internal var pointer: UnsafeMutablePointer<CDenseMatrix>?

    public var string: String? {
        // Get a pointer to char* buff
        let buffOpt: UnsafeMutablePointer<Int8>? = dense_matrix_str(self.pointer)
        if let buff = buffOpt {
            // Copy the buff so we can free it
            let str: String = String(cString: buff)
            // Free the string buff
            basic_str_free(buff)
            // Return the copy
            return str
        }
        
        // Failure case
        return nil
    }

    public var rows: Int {
        return Int(dense_matrix_rows(self.pointer))
    }

    public var cols: Int {
        return Int(dense_matrix_cols(self.pointer))
    }

    /// Allocate a new matrix on the heap
    internal init() {
        self.pointer = dense_matrix_new()
    }

    public init(rows: Int, cols: Int, elements: Vector) {
        self.pointer = dense_matrix_new_vec(UInt32(rows), UInt32(cols), elements.pointer)
    }

    /// I'm not entirely sure what the state of the elements in the resulting
    /// matrix from this is. It seems to segfault on atleast some operations
    /// though.
    internal init(rows: Int, cols: Int) {
        self.pointer = dense_matrix_new_rows_cols(UInt32(rows), UInt32(cols))
    }

    public typealias ArrayLiteralElement = Vector
    public required convenience init(arrayLiteral elements: Vector...) {
        precondition(elements.count != 0, "Cannot initialize empty matrix")
        // Check that all of the vectors are the same length
        let cols = elements.first!.count
        for i in 0..<elements.count {
            precondition(elements[i].count == cols, "All vectors must be the same length")
        }

        self.init(rows: elements.count, cols: cols)
        for i in 0..<elements.count {
            self[row: i] = elements[i]
        }
    }

    /// Free the memory for the matrix
    deinit {
        Matrix.free(self.pointer)
    }

    //------------ Member Functions --------

    public func resize(rows: Int, cols: Int) {
        precondition(self.rows * self.cols == rows * cols, "Number of elements must be the same.")
        try! checkReturn(dense_matrix_rows_cols(self.pointer, UInt32(rows), UInt32(cols)))
    }

    public func get(row: Int, col: Int) -> Basic {
        precondition(0 <= row && row < self.rows, "Row index out of bounds")
        precondition(0 <= col && col < self.cols, "Column index out of bounds")

        let newBasic = Basic()
        try! checkReturn(dense_matrix_get_basic(newBasic.pointer, self.pointer, UInt(row), UInt(col)))
        return newBasic
    }

    public func set(row: Int, col: Int, elem: Basic) {
        precondition(0 <= row && row < self.rows, "Row index out of bounds")
        precondition(0 <= col && col < self.cols, "Column index out of bounds")

        try! checkReturn(dense_matrix_set_basic(self.pointer, UInt(row), UInt(col), elem.pointer))
    }

    //---------------- Functions --------------

    public func diff(wrt: Basic) throws -> Matrix {
        let newMatrix = Matrix()
        try checkReturn(dense_matrix_diff(newMatrix.pointer, self.pointer, wrt.pointer))
        return newMatrix
    }
    
    public func jacobian(wrt: Matrix) throws -> Matrix {
        let newMatrix = Matrix()
        try checkReturn(dense_matrix_jacobian(newMatrix.pointer, self.pointer, wrt.pointer))
        return newMatrix
    }

    //---------- Sub Matricces and Stacking -------

    public func submatrix(startRow: Int, endRow: Int,
                          startCol: Int, endCol: Int,
                          rowStep: Int = 1, colStep: Int = 1) throws -> Matrix {
        let newMatrix = Matrix()
        try checkReturn(dense_matrix_submatrix(newMatrix.pointer,
                                           self.pointer,
                                           UInt(startRow),
                                           UInt(startCol),
                                           UInt(endRow),
                                           UInt(endCol),
                                           UInt(rowStep),
                                           UInt(colStep)))
        return newMatrix
    }

    // Row join means to append columns
    public func appendColumns(_ otherMatrix: Matrix) throws {
        try checkReturn(dense_matrix_row_join(self.pointer, otherMatrix.pointer))
    }
    
    public func appendRows(_ otherMatrix: Matrix) throws {
        try checkReturn(dense_matrix_col_join(self.pointer, otherMatrix.pointer))
    }

    public func deleteRow(_ index: Int) throws {
        try checkReturn(dense_matrix_row_del(self.pointer, UInt32(index)))
    }

    public func deleteColumn(_ index: Int) throws {
        try checkReturn(dense_matrix_col_del(self.pointer, UInt32(index)))
    }

    //----------------- Free ----------------
    internal static func free(_ pointer: UnsafeMutablePointer<CDenseMatrix>?) {
        // Free the pointer
        dense_matrix_free(pointer)
    }
}

extension Matrix {
    public static func ones(_ rows: Int, _ cols: Int) -> Matrix {
        let newMatrix = Matrix()
        try! checkReturn(dense_matrix_ones(newMatrix.pointer,
                                           UInt(rows),
                                           UInt(cols)))
        return newMatrix
    }

    public static func zeros(_ rows: Int, _ cols: Int) -> Matrix {
        let newMatrix = Matrix()
        try! checkReturn(dense_matrix_zeros(newMatrix.pointer,
                                            UInt(rows),
                                            UInt(cols)))
        return newMatrix
    }

    public static func eye(_ rows: Int, _ cols: Int, offset: Int = 0) -> Matrix {
        let newMatrix = Matrix()
        try! checkReturn(dense_matrix_eye(newMatrix.pointer,
                                          UInt(rows),
                                          UInt(cols),
                                          Int32(offset)))
        return newMatrix
    }

    public static func diag(_ vector: Vector, offset: Int = 0) -> Matrix {
        let newMatrix = Matrix()
        try! checkReturn(dense_matrix_diag(newMatrix.pointer,
                                           vector.pointer,
                                           offset))
        return newMatrix
    }
}

extension Matrix: CustomStringConvertible {
    public var description: String {
        return self.string ?? ""
    }
}

extension Matrix {
    
    /// Get M(row, column) element of Matrix.
    ///
    /// - Parameters:
    ///    - row: row position of element (0-based)
    ///    - col: col position of element (0-based)
    public subscript(_ row: Int, _ col: Int ) -> Basic {
        get {
            return self.get(row: row, col: col)
        }
        
        set(newValue) {
            self.set(row: row, col: col, elem: newValue)
        }
    }
    
    /// Get M(row) row of Matrix.
    ///
    /// - Parameters:
    ///    - row: row index (0-based)
    public subscript(row row: Int) -> Vector {
        get {
            precondition(row < rows, "Invalid index")
            let vec: Vector = []
            for i in 0..<self.cols {
                vec.append(self[row, i])
            }
            return vec
        }
        
        set {
            precondition(row < rows, "Invalid index")
            precondition(newValue.count == cols, "Input dimensions must agree")
            for i in 0..<self.cols {
                self[row, i] = newValue[i]
            }
        }
    }
    
    /// Get M(col) column of Matrix.
    ///
    /// - Parameters:
    ///    - col: column index (0-based)
    public subscript(col col: Int) -> Vector {
        get {
            precondition(col < cols, "Invalid index")
            let vec: Vector = []
            for i in 0..<self.rows {
                vec.append(self[i, col])
            }
            return vec
        }
        
        set {
            precondition(col < cols, "Invalid index")
            precondition(newValue.count == rows, "Input dimensions must agree")
            for i in 0..<self.rows {
                self[i, col] = newValue[i]
            }
        }
    }
}
