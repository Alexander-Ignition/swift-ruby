import XCTest
@testable import RubyKit

class TestCase: XCTestCase {

    override class func setUp() {
        super.setUp()
        Ruby.showVersion()
    }

    override func setUp() {
        super.setUp()
    }
}
