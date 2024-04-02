//
//  AuthorizationScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias S = AuthorizationSelector
private typealias ENV = UITestEnvConfig

final class AuthorizationScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var logoImage: XCUIElement?
    private var phoneNumberTitle: XCUIElement?
    private var phoneNumberField: XCUIElement?
    private var phoneNumberError: XCUIElement?
    private var formatNumbersTitle: XCUIElement?
    private var formatNumbersButton: XCUIElement?
    private var continueButton: XCUIElement?
    
    private var availableNumberFormats: XCUIElement?
    private var availablePhonesDescription: XCUIElement?
    private var availablePhonesCloseButton: XCUIElement?
    private var availableNumberFlag: XCUIElement?
    private var availableNumberValue: XCUIElement?
    
    func getLogo() -> XCUIElement {
        self.logoImage = app.images[S.logoImage]
        return logoImage!
    }
    
    func getPhoneNumberTitle() -> XCUIElement {
        self.phoneNumberTitle = app.staticTexts[S.phoneNubmerTitle]
        return phoneNumberTitle!
    }
    
    func getPhoneNumberField() -> XCUIElement {
        self.phoneNumberField = app.textFields.element
        XCTAssertTrue(phoneNumberField!.waitForHittable(timeout: ENV.timeout))
        return phoneNumberField!
    }
    
    func getPhoneNumberError() -> XCUIElement {
        self.phoneNumberError = app.staticTexts[S.phoneNumberError]
        return phoneNumberError!
    }
    
    func getFormatNumbersTitle() -> XCUIElement {
        self.formatNumbersTitle = app.staticTexts[S.formatNumbersTitle]
        return formatNumbersTitle!
    }
    
    func getFormatNumbersButton() -> XCUIElement {
        self.formatNumbersButton = app.buttons[S.formatNumbersButton]
        return formatNumbersButton!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons[S.continueButton]
        XCTAssertTrue(continueButton!.waitForHittable(timeout: ENV.timeout))
        return continueButton!
    }
    
    func getAvailableNumberFormats() -> XCUIElement {
        self.availableNumberFormats = app.staticTexts[S.availableNumberFormats]
        return availableNumberFormats!
    }
    
    func getAvailablePhonesDescription() -> XCUIElement {
        self.availablePhonesDescription = app.staticTexts[S.availablePhonesDescription]
        return availablePhonesDescription!
    }
    
    func getAvailablePhonesCloseButton() -> XCUIElement {
        self.availablePhonesCloseButton = app.buttons[S.availablePhonesCloseButton]
        return availablePhonesCloseButton!
    }
    
    func getAvailableNumberFlag(index: Int) -> XCUIElement {
        self.availableNumberFlag = app.cells.allElementsBoundByIndex[index].images.element
        return availableNumberFlag!
    }
    
    func getAvailableNumberValue(index: Int) -> XCUIElement {
        self.availableNumberValue = app.cells.allElementsBoundByIndex[index].staticTexts.element
        return availableNumberValue!
    }
}
