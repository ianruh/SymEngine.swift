import CSymEngine


public class Vector: ExpressibleByArrayLiteral {
    
    // Stores the pointer to the matrix object in memory
    internal var pointer: UnsafeMutablePointer<CVecBasic>?

    /// Allocate a new matrix on the heap
    public init() {
        self.pointer = vecbasic_new()
    }

    /// Free the memory for the vector
    deinit {
        Vector.free(self.pointer)
    }

    //---------------- ArrayLiteral --------

    public typealias ArrayLiteralElement = Basic

    public convenience required init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.append(element)
        }
    }

    public convenience init(_ arr: [Basic]) {
        self.init()
        for element in arr {
            self.append(element)
        }
    }

    //-------------- Member Functions -------

    public func append(_ elem: Basic) {
        try! checkReturn(vecbasic_push_back(self.pointer, elem.pointer))
    }

    public func get(_ index: Int) -> Basic {
        precondition(0 <= index && index < self.count, "Index out of bounds")
        let newBasic = Basic()
        try! checkReturn(vecbasic_get(self.pointer, index, newBasic.pointer))
        return newBasic
    }

    public func set(index: Int, elem: Basic) {
        precondition(0 <= index && index < self.count, "Index out of bounds")
        try! checkReturn(vecbasic_set(self.pointer, index, elem.pointer))
    }

    public func erase(index: Int) {
        precondition(0 <= index && index < self.count, "Index out of bounds")
        try! checkReturn(vecbasic_erase(self.pointer, index))
    }

    public var count: Int {
        return vecbasic_size(self.pointer)
    }

    //----------------- Free ----------------
    internal static func free(_ pointer: UnsafeMutablePointer<CVecBasic>?) {
        // Free the pointer
        vecbasic_free(pointer)
    }
}

extension Vector: Collection {
    // Required nested types, that tell Swift what our collection contains
    public typealias Index = Int
    public typealias Element = Basic

    // The upper and lower bounds of the collection, used in iterations
    public var startIndex: Index { return 0 }
    public var endIndex: Index { return self.count-1 }

    // Required subscript, based on a dictionary index
    public subscript(index: Index) -> Basic {
        get {
            return self.get(index)
        }
        set(newValue) {
            self.set(index: index, elem: newValue)
        }
    }

    // Method that returns the next index when iterating
    public func index(after i: Index) -> Index {
        if( i >= self.startIndex && i <= self.endIndex) {
            return i + 1
        } else {
            fatalError("Index out of bounds")
        }
    }
}
