//
//  MoreScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 24.01.2024.
//

import XCTest
private typealias S = MoreScreenSelector
private typealias ENV = UITestEnvConfig

final class MoreScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var doneButton: XCUIElement?
    private var qrCodeButton: XCUIElement?
    
    private var profileImage: XCUIElement?
    private var profileTitle: XCUIElement?
    private var profileDesc: XCUIElement?
    
    private var bonusesImage: XCUIElement?
    private var bonusesTitle: XCUIElement?
    
    private var myFamilyImage: XCUIElement?
    private var myFamilyTitle: XCUIElement?
    
    private var myActivityImage: XCUIElement?
    private var myActivityTitle: XCUIElement?
    
    private var myCalendarImage: XCUIElement?
    private var myCalendarTitle: XCUIElement?
    
    private var promocodeImage: XCUIElement?
    private var promocodeTitle: XCUIElement?
    
    private var walletImage: XCUIElement?
    private var walletTitle: XCUIElement?
    
    private var settingsImage: XCUIElement?
    private var settingsTitle: XCUIElement?
    
    private var questionsImage: XCUIElement?
    private var questionsTitle: XCUIElement?
    
    private var chatImage: XCUIElement?
    private var chatTitle: XCUIElement?
    
    private var aboutAppImage: XCUIElement?
    private var aboutAppTitle: XCUIElement?
    
    private var thanksImage: XCUIElement?
    private var thanksTitle: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getDoneButton() -> XCUIElement {
        self.doneButton = app.buttons[S.doneButton]
        return doneButton!
    }
    
    func getQrCodeButton() -> XCUIElement {
        self.qrCodeButton = app.buttons[S.qrCodeButton]
        XCTAssertTrue(qrCodeButton!.waitForHittable(timeout: ENV.timeout))
        return qrCodeButton!
    }
    
    func getProfileImage() -> XCUIElement {
        self.profileImage = app.cells.allElementsBoundByIndex[0].staticTexts.allElementsBoundByIndex[2]
        return profileImage!
    }
    
    func getProfileTitle() -> XCUIElement {
        self.profileTitle = app.cells.allElementsBoundByIndex[0].staticTexts.allElementsBoundByIndex[1]
        return profileTitle!
    }
    
    func getProfileDesc() -> XCUIElement {
        self.profileDesc = app.cells.allElementsBoundByIndex[0].staticTexts.allElementsBoundByIndex[0]
        return profileDesc!
    }
    
    func getBonusesImage() -> XCUIElement {
        self.bonusesImage = app.cells.allElementsBoundByIndex[1].images.element
        return bonusesImage!
    }
    
    func getBonusesTitle() -> XCUIElement {
        self.bonusesTitle = app.staticTexts[S.bonusesTitle]
        XCTAssertTrue(bonusesTitle!.waitForHittable(timeout: ENV.timeout))
        return bonusesTitle!
    }
    
    func getMyFamilyImage() -> XCUIElement {
        self.myFamilyImage = app.cells.allElementsBoundByIndex[2].images.firstMatch
        return myFamilyImage!
    }
    
    func getMyFamilyTitle() -> XCUIElement {
        self.myFamilyTitle = app.staticTexts[S.myFamilyTitle]
        XCTAssertTrue(myFamilyTitle!.waitForHittable(timeout: ENV.timeout))
        return myFamilyTitle!
    }
    
    func getMyActivityImage() -> XCUIElement {
        self.myActivityImage = app.cells.allElementsBoundByIndex[3].images.firstMatch
        return myActivityImage!
    }
    
    func getMyActivityTitle() -> XCUIElement {
        self.myActivityTitle = app.staticTexts[S.myActivityTitle]
        XCTAssertTrue(myActivityTitle!.waitForHittable(timeout: ENV.timeout))
        return myActivityTitle!
    }
    
    func getMyCalendarImage() -> XCUIElement {
        self.myCalendarImage = app.cells.allElementsBoundByIndex[4].images.firstMatch
        return myCalendarImage!
    }
    
    func getMyCalendarTitle() -> XCUIElement {
        self.myCalendarTitle = app.staticTexts[S.myCalendarTitle]
        XCTAssertTrue(myCalendarTitle!.waitForHittable(timeout: ENV.timeout))
        return myCalendarTitle!
    }
    
    func getPromocodeImage() -> XCUIElement {
        self.promocodeImage = app.cells.allElementsBoundByIndex[5].images.firstMatch
        return promocodeImage!
    }
    
    func getPromocodeTitle() -> XCUIElement {
        self.promocodeTitle = app.staticTexts[S.promocodeTitle]
        XCTAssertTrue(promocodeTitle!.waitForHittable(timeout: ENV.timeout))
        return promocodeTitle!
    }
    
    func getWalletImage() -> XCUIElement {
        self.walletImage = app.cells.allElementsBoundByIndex[6].images.firstMatch
        return walletImage!
    }
    
    func getWalletTitle() -> XCUIElement {
        self.walletTitle = app.staticTexts[S.walletTitle]
        XCTAssertTrue(walletTitle!.waitForHittable(timeout: ENV.timeout))
        return walletTitle!
    }
    
    func getSettingsImage() -> XCUIElement {
        self.settingsImage = app.cells.allElementsBoundByIndex[7].images.firstMatch
        return settingsImage!
    }
    
    func getSettingsTitle() -> XCUIElement {
        self.settingsTitle = app.staticTexts[S.settingsTitle]
        XCTAssertTrue(settingsTitle!.waitForHittable(timeout: ENV.timeout))
        return settingsTitle!
    }
    
    func getQuestionsImage() -> XCUIElement {
        self.questionsImage = app.cells.allElementsBoundByIndex[8].images.firstMatch
        return questionsImage!
    }
    
    func getQuestionsTitle() -> XCUIElement {
        self.questionsTitle = app.staticTexts[S.questionsTitle]
        XCTAssertTrue(questionsTitle!.waitForHittable(timeout: ENV.timeout))
        return questionsTitle!
    }
    
    func getChatImage() -> XCUIElement {
        self.chatImage = app.cells.allElementsBoundByIndex[9].images.firstMatch
        return chatImage!
    }
    
    func getChatTitle() -> XCUIElement {
        self.chatTitle = app.staticTexts[S.chatTitle]
        XCTAssertTrue(chatTitle!.waitForHittable(timeout: ENV.timeout))
        return chatTitle!
    }
    
    func getAboutAppImage() -> XCUIElement {
        self.aboutAppImage = app.cells.allElementsBoundByIndex[10].images.firstMatch
        return aboutAppImage!
    }
    
    func getAboutAppTitle() -> XCUIElement {
        self.aboutAppTitle = app.staticTexts[S.aboutAppTitle]
        XCTAssertTrue(aboutAppTitle!.waitForHittable(timeout: ENV.timeout))
        return aboutAppTitle!
    }
    
    func getThanksImage() -> XCUIElement {
        self.thanksImage = app.cells.allElementsBoundByIndex[11].images.firstMatch
        return thanksImage!
    }
    
    func getThanksTitle() -> XCUIElement {
        self.thanksTitle = app.staticTexts[S.thanksTitle]
        XCTAssertTrue(thanksTitle!.waitForHittable(timeout: ENV.timeout))
        return thanksTitle!
    }
}
