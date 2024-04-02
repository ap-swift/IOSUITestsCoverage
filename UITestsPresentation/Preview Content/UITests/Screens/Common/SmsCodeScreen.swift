//
//  SmsCodeScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 17.01.2024.
//

import XCTest
private typealias S = SmsCodeScreenSelector
private typealias ENV = UITestEnvConfig

final class SmsCodeScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var smsCodeTitle: XCUIElement?
    private var smsCodeField: XCUIElement?
    
    func getSmsCodeTitle() -> XCUIElement {
        self.smsCodeTitle = app.staticTexts[S.smsCodeTitle]
        return smsCodeTitle!
    }
    
    func getSmsCodeField() -> XCUIElement {
        self.smsCodeField = app.textFields.firstMatch
        return smsCodeField!
    }
}
