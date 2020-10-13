import XCTest
@testable import RubyKit

final class RubyObjectTests: XCTestCase {

    func testString() {
        Ruby.setup()

        let string: RubyObject = "hello"
        print(string)
        print(string.isNil)

//        Ruby.cleanup()
    }

    func testString2() {
        Ruby.setup()

        let string: RubyObject = "hello"
        print(string)

//        Ruby.cleanup()
    }

}
