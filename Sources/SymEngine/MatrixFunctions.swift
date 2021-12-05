import CSymEngine

public func det(_ arg: Matrix) throws -> Basic {
    let newBasic = Basic()
    try checkReturn(dense_matrix_det(newBasic.pointer, arg.pointer))
    return newBasic
}

public func inv(_ arg: Matrix) throws -> Matrix {
    let newMatrix = Matrix()
    try checkReturn(dense_matrix_inv(newMatrix.pointer, arg.pointer))
    return newMatrix
}

public func transpose(_ arg: Matrix) throws -> Matrix {
    let newMatrix = Matrix()
    try checkReturn(dense_matrix_transpose(newMatrix.pointer, arg.pointer))
    return newMatrix
}

public func solve(A: Matrix, b: Matrix) throws -> Matrix {
    let newMatrix = Matrix()
    try checkReturn(dense_matrix_LU_solve(newMatrix.pointer,
                                          A.pointer,
                                          b.pointer))
    return newMatrix
}
