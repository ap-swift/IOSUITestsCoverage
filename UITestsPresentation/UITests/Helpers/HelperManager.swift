import XCTest

class HelpersManager {
    private let screensManager: ScreensManager = ScreensManager()

    private var chooseCarHelper: ChooseCarHelper

    private var commonHelper: CommonHelper?

    init(){
        self.chooseCarHelper = ChooseCarHelper(screensManager: screensManager)
    }

    func getChooseCarHelper() -> ChooseCarHelper { return self.chooseCarHelper }

    func getCommonHelper() -> CommonHelper {
        if (self.commonHelper == nil) { self.commonHelper = CommonHelper(helpersManager: self, screensManager: self.screensManager) }
        return self.commonHelper!
    }

}
