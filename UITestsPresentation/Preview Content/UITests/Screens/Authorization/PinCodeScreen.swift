//
//  PinCodeScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 17.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = PinCodeSelector

final class PinCodeScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var forgetCodeButton: XCUIElement?
    private var pincodeDigitButton: XCUIElement?
    
    func getForgetCodeButton() -> XCUIElement {
        self.pincodeDigitButton = app.buttons[S.forgetCodeButton]
        return pincodeDigitButton!
    }
    
    func getPinCodeDigitButtonVia(digit: Int) -> XCUIElement {
        self.pincodeDigitButton = app.staticTexts[String(digit)]
        return pincodeDigitButton!
    }
}
