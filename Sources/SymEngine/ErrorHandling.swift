import CSymEngine

/**
Errors that can be thrown by SymEngine
*/
public enum SymEngineError: Error {
    case runtimeError
    case divideByZero
    case notImplemented
    case domainError
    case parseError
    case unknownError
}

/**
Checks the return value of type `symengine_exceptions_t` and response by throwing the
 associated error, or just returning if there is no error.

- Parameter _: The return value to check

- Throws: The `SymEngineError` associated for each error return value.
*/
internal func checkReturn(_ retVal: symengine_exceptions_t) throws {
    switch(retVal) {
    case SYMENGINE_NO_EXCEPTION:
        return
    case SYMENGINE_RUNTIME_ERROR:
        throw SymEngineError.runtimeError
    case SYMENGINE_DIV_BY_ZERO:
        throw SymEngineError.divideByZero
    case SYMENGINE_NOT_IMPLEMENTED:
        throw SymEngineError.notImplemented
    case SYMENGINE_DOMAIN_ERROR:
        throw SymEngineError.domainError
    case SYMENGINE_PARSE_ERROR:
        throw SymEngineError.parseError
    default:
        throw SymEngineError.unknownError
    }
}
