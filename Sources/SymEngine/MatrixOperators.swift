import CSymEngine

public func +(lhs: Matrix, rhs: Matrix) -> Matrix {
    precondition(lhs.rows == rhs.rows &&
                 lhs.cols == rhs.cols, "Matrix dimensions must agree")

    let newMatrix = Matrix()
    try! checkReturn(dense_matrix_add_matrix(newMatrix.pointer,
                                             lhs.pointer,
                                             rhs.pointer))
    return newMatrix
}


public func *(lhs: Matrix, rhs: Matrix) -> Matrix {
    precondition(lhs.cols == rhs.rows, "Matrix dimensions must agree")

    let newMatrix = Matrix()
    try! checkReturn(dense_matrix_mul_matrix(newMatrix.pointer,
                                             lhs.pointer,
                                             rhs.pointer))
    return newMatrix
}

public func +(lhs: Matrix, rhs: Basic) -> Matrix {
    let newMatrix = Matrix()
    try! checkReturn(dense_matrix_add_scalar(newMatrix.pointer,
                                             lhs.pointer,
                                             rhs.pointer))
    return newMatrix
}
public func +(lhs: Basic, rhs: Matrix) -> Matrix {
    return rhs + lhs
}

public func *(lhs: Matrix, rhs: Basic) -> Matrix {
    let newMatrix = Matrix()
    try! checkReturn(dense_matrix_mul_scalar(newMatrix.pointer,
                                             lhs.pointer,
                                             rhs.pointer))
    return newMatrix
}
public func *(lhs: Basic, rhs: Matrix) -> Matrix {
    return rhs + lhs
}

extension Matrix: Equatable {}

public func ==(lhs: Matrix, rhs: Matrix) -> Bool {
    let result: Int32 = dense_matrix_eq(lhs.pointer, rhs.pointer)
    return result == 1 ? true : false
}
