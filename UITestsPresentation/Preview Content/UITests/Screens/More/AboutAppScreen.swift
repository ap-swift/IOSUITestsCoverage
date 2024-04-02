//
//  AboutAppScreenSelector.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 24.01.2024.
//

import XCTest
private typealias S = AboutAppScreenSelector
private typealias ENV = UITestEnvConfig

final class AboutAppScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var backButton: XCUIElement?
    private var appImage: XCUIElement?
    private var appVersion: XCUIElement?
    
    private var userAgreementTitle: XCUIElement?
    private var additionalInformationTitle: XCUIElement?
    private var medsiTitle: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getBackButton() -> XCUIElement {
        self.backButton = app.buttons[S.backButton]
        return backButton!
    }
    
    func getAppImage() -> XCUIElement {
        self.appImage = app.images.element
        return appImage!
    }
    
    func getAppVersion() -> XCUIElement {
        self.appVersion = app.tables.staticTexts.firstMatch
        return appVersion!
    }
    
    func getUserAgreementTitle() -> XCUIElement {
        self.userAgreementTitle = app.staticTexts.allElementsBoundByIndex[2]
        return userAgreementTitle!
    }
    
    func getAdditionalInformationTitle() -> XCUIElement {
        self.additionalInformationTitle = app.staticTexts.allElementsBoundByIndex[3]
        return additionalInformationTitle!
    }
    
    func getMedsiTitle() -> XCUIElement {
        self.medsiTitle = app.staticTexts.allElementsBoundByIndex[4]
        return medsiTitle!
    }
}
