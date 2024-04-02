import XCTest
private typealias ENV = UITestEnvConfig

class BaseUITest: XCTestCase {
    let h: HelpersManager = HelpersManager()


    override func setUp() {
        step("Preparing the environment and launching the application") {
            self.beforeTest()
        }
    }

    override func tearDown() {
        step("Completing the test and closing the application") {
            h.getCommonHelper().closeApplication()
        }
    }

    func beforeTest(softAssert: Bool = ENV.defaultContinueAfterFailure) {
        continueAfterFailure = softAssert
        _ = h.getCommonHelper().launchApplication()
    }

    

}
