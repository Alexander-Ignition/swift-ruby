import XCTest
@testable import RubyKit

final class RubyTests: TestCase {

    // MARK: - 

    func testEval() {
        let result = Ruby.eval("2 + 3")

        print(result.isNil)
    }

    func testArrayLiteral() {
        //
    }
}
