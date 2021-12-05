import XCTest
@testable import SymEngine

/**
 These tests are only really intended to test the wrapper, not SymEngine itself.
 */
final class SymEngineTests: XCTestCase {
    
    var x: Basic = Basic(symbol: "x")
    var x2: Basic = Basic(symbol: "x")
    var y: Basic = Basic(symbol: "y")
    
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

    func testDerivative() {
        do {
            let x = Basic(symbol: "x")
            let y = Basic(symbol: "y")

            XCTAssertEqual(try diff(of: x*x, withRespectTo: x), 2*x)
            XCTAssertEqual(try diff(of: x*y, withRespectTo: x), y)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

    func testHash() { 
        let x = Basic(symbol: "x")
        let xx =  Basic(symbol: "x")
        let y = Basic(symbol: "y")

        let one = x*x
        let two = x*x

        var hasherOne = Hasher()
        hasherOne.combine(one)
        let hashOne = hasherOne.finalize()

        var hasherTwo = Hasher()
        hasherTwo.combine(two)
        let hashTwo = hasherTwo.finalize()

        XCTAssertEqual(one, two)
        XCTAssertEqual(hashOne, hashTwo)

        var hasherThree = Hasher()
        hasherThree.combine(x)
        let hashThree = hasherThree.finalize()

        var hasherFour = Hasher()
        hasherFour.combine(xx)
        let hashFour = hasherFour.finalize()

        var hasherFive = Hasher()
        hasherFive.combine(y)
        let hashFive = hasherFive.finalize()

        XCTAssertEqual(x, xx)
        XCTAssertEqual(hashThree, hashFour)
    
        XCTAssertNotEqual(hashThree, hashFive)
        XCTAssertNotEqual(x, y)
    }

    static var allTests = [
        ("Test Basics", testBasics),
        ("Test Add/Subtract", testAddSubtract),
        ("Test Multiply/Divide", testMultiplyDivide),
        ("Test Power", testPower),
        ("Test Derivative", testDerivative),
        ("Test Hash", testHash),
    ]
}
