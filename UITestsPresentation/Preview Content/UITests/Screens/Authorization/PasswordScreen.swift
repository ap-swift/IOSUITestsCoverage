//
//  PasswordScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 17.01.2024.
//

import XCTest
private typealias S = PasswordScreenSelector
private typealias ENV = UITestEnvConfig

final class PasswordScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var backButton: XCUIElement?
    private var newPasswordTitle: XCUIElement?
    private var passwordTitle: XCUIElement?
    private var passwordField: XCUIElement?
    private var userAgreementsTitle: XCUIElement?
    private var enterButton: XCUIElement?
    private var registrationButton: XCUIElement?
    
    private var errorTitle: XCUIElement?
    private var errorDesc: XCUIElement?
    
    func getBackButton() -> XCUIElement {
        self.backButton = app.images[S.backButton]
        XCTAssertTrue(backButton!.waitForHittable(timeout: ENV.timeout))
        return backButton!
    }
    
    func getNewPasswordTitle() -> XCUIElement {
        self.newPasswordTitle = app.staticTexts[S.newPasswordTitle]
        return newPasswordTitle!
    }
    
    func getPasswordTitle() -> XCUIElement {
        self.passwordTitle = app.staticTexts[S.passwordTitle]
        return passwordTitle!
    }
    
    func getPasswordField() -> XCUIElement {
        self.passwordField = app.secureTextFields.firstMatch
        XCTAssertTrue(passwordField!.waitForHittable(timeout: ENV.timeout))
        return passwordField!
    }
    
    func getUserAgreementsTitle() -> XCUIElement {
        self.userAgreementsTitle = app.links[S.userAgreementsTitle]
        XCTAssertTrue(userAgreementsTitle!.waitForHittable(timeout: ENV.timeout))
        return userAgreementsTitle!
    }
    
    func getEnterButton() -> XCUIElement {
        self.enterButton = app.buttons[S.enterButton]
        XCTAssertTrue(enterButton!.waitForHittable(timeout: ENV.timeout))
        return enterButton!
    }
    
    func getRegistrationButton() -> XCUIElement {
        self.registrationButton = app.buttons[S.registrationButton]
        XCTAssertTrue(registrationButton!.waitForHittable(timeout: ENV.timeout))
        return registrationButton!
    }
    
    func getErrorTitle() -> XCUIElement {
        self.errorTitle = app.staticTexts[S.errorTitle]
        return errorTitle!
    }
    
    func getErrorDesc() -> XCUIElement {
        self.errorDesc = app.staticTexts[S.errorDesc]
        return errorDesc!
    }
}
