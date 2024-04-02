import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = CarsListSelectors

class ChooseCarHelper: XCTest {
    private let screensManager: ScreensManager

    init(screensManager: ScreensManager) {
        self.screensManager = screensManager
    }

    func clickGoOn() -> ChooseCarHelper {
        step("Tap button \"Choose car\"") {
            XCTAssertTrue(screensManager.getWelcomeScreen().getChooseCarTitle().waitForExistence(timeout: ENV.timeout))
            screensManager.getWelcomeScreen().getChooseCarTitle().tap()
        }
        return self
    }

    func chooseCar() -> ChooseCarHelper {
        step("Choose a car (BMW)") {
            XCTAssertTrue(screensManager.getCommonScreen().getBackButton().waitForExistence(timeout: ENV.timeout))
            XCTAssertTrue(screensManager.getAutosListScreen().getListTitle().waitForExistence(timeout: ENV.timeout))
            XCTAssertTrue(screensManager.getAutosListScreen().getBmw().isHittable)
            screensManager.getAutosListScreen().getBmw().tap()
        }
        return self
    }

    func checkAutoDescription() -> ChooseCarHelper {
        step("Check info about the car") {
            XCTAssertTrue(screensManager.getCommonScreen().getBackButton().waitForExistence(timeout: ENV.timeout))
            XCTAssertEqual(screensManager.getCarScreen().getCarTitle().label, S.bmw)
        }
        return self
    }
}
