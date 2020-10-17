import XCTest
@testable import RubyKit

final class RubyObjectTests: XCTestCase {

    func testString() {
        let string: RubyObject = "hello"
        print(string)
        print(string.isNil)
    }

    func testString2() {
        let string: RubyObject = "hello"
        print(string)
    }

}
