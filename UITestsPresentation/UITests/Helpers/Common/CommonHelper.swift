import XCTest
private typealias ENV = UITestEnvConfig

final class CommonHelper: XCTest {
    private let h: HelpersManager
    private let screens: ScreensManager
    private let app = XCUIApplication()

    init(helpersManager: HelpersManager, screensManager: ScreensManager) {
        self.h = helpersManager
        self.screens = screensManager
    }

    func addLocalisationLaunchArgs() -> CommonHelper {
        step("LaunchArguments") {
            app.launchArguments += ["-AppleLanguages", ENV.language_eng]
            app.launchArguments += ["-AppleLocale", ENV.language_eng]
        }
        return self
    }

    func launchApplication() -> CommonHelper {
        step("Launch") {
            app.launch()
        }
        return self
    }

    func closeApplication() {
        step("Terminate") {
            sleep(1)
            app.terminate()
        }
    }

    func tapCoordinate(xCoordinate: Double = 100, yCoordinate: Double = 100) {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }

}
