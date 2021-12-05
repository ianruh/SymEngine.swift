import XCTest
@testable import SymEngine

/**
 These tests are only really intended to test the wrapper, not SymEngine itself.
 */
final class VectorTests: XCTestCase {
    
    func testGetSet() {
        let vec = Vector()
        let x = Basic(symbol: "x")
        vec.append(x)

        XCTAssertEqual(vec.count, 1)
        XCTAssertEqual(x, vec[0])
    }

    func testDelete() {
        let x = Basic("x")
        let y = Basic("y")

        let vec: Vector = [x, y]

        XCTAssertEqual(vec.count, 2)

        vec.erase(index: 1)

        XCTAssertEqual(vec.count, 1)
    }

    static var allTests = [
        ("Test Get Set", testGetSet),
        ("Test Delete", testDelete),
    ]
}
