import XCTest
@testable import SymEngine

/**
 These tests are only really intended to test the wrapper, not SymEngine itself.
 */
final class SymEngineTests: XCTestCase {
    
    var x: Basic = Basic("x")
    var x2: Basic = Basic("x")
    var y: Basic = Basic("y")
    
    func testBasics() {
        XCTAssertEqual(x, x)
        XCTAssertEqual(Basic(0), Basic(0))
        XCTAssertTrue(x == x)
        
        XCTAssertNotEqual(x, y)
        XCTAssertFalse(x === x2)
    }
    
    func testAddSubtract() {
        XCTAssertEqual(x-x, 0)
        XCTAssertEqual(x+y, y+x)
        XCTAssertEqual(x-x, y-y)
        XCTAssertEqual(x, x + Basic(0))
        XCTAssertEqual(x, x + Basic(0.0))
        
        XCTAssertNotEqual(x-x, x+x)
        XCTAssertNotEqual(x-(x+x), x-x+x)
    }
    
    func testMultiplyDivide() {
        XCTAssertEqual(2*x, x+x)
        XCTAssertEqual(x/x, Basic(1))
        XCTAssertEqual(x*x, x**2)
        
        XCTAssertNotEqual(x/y, y/x)
    }
    
    func testPower() {
        XCTAssertEqual(x*x, x**2)
        XCTAssertEqual(x**0, Basic(1))
        XCTAssertEqual(x*x/x**2, Basic(1))
        
        XCTAssertNotEqual(x**y, y**x)
    }

    static var allTests = [
        ("Test Basics", testBasics),
        ("Test Add/Subtract", testAddSubtract),
        ("Test Multiply/Divide", testMultiplyDivide),
        ("Test Power", testPower),
    ]
}
