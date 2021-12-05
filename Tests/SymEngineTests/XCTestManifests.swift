import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SymEngineTests.allTests),
        testCase(VectorTests.allTests),
    ]
}
#endif
