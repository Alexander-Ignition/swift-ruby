import XCTest
@testable import RubyKit

final class RubyTests: TestCase {

    // MARK: - 

    func testEval() {
        Ruby.setup()

        let result = Ruby.eval("2 + 3")

        print(result.isNil)
    }

    func testArrayLiteral() {
        //
    }
}
