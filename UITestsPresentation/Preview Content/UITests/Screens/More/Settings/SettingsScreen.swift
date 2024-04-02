//
//  SettingsScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 30.01.2024.
//

import XCTest
private typealias S = SettingsScreenSelector
private typealias ENV = UITestEnvConfig

final class SettingsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var backButton: XCUIElement?
    
    private var faceIdTitle: XCUIElement?
    private var faceIdSwitcher: XCUIElement?
    private var notificationTitle: XCUIElement?
    private var mycalendarTitle: XCUIElement?
    private var changePasswordTitle: XCUIElement?
    private var themeTitle: XCUIElement?
    private var themeDesc: XCUIElement?
    private var themeValue: XCUIElement?
    private var deleteAccTitle: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getBackButton() -> XCUIElement {
        self.backButton = app.buttons[S.backButton]
        return backButton!
    }
    
    func getFaceIdTitle() -> XCUIElement {
        self.faceIdTitle = app.staticTexts[S.faceIdTitle]
        return faceIdTitle!
    }
    
    func getFaceIdSwitcher() -> XCUIElement {
        self.faceIdSwitcher = app.switches.firstMatch
        return faceIdSwitcher!
    }
    
    func getNotificationTitle() -> XCUIElement {
        self.notificationTitle = app.staticTexts[S.notificationTitle]
        return notificationTitle!
    }
    
    func getMycalendarTitle() -> XCUIElement {
        self.mycalendarTitle = app.staticTexts[S.mycalendarTitle]
        return mycalendarTitle!
    }
    
    func getChangePasswordTitle() -> XCUIElement {
        self.changePasswordTitle = app.staticTexts[S.changePasswordTitle]
        return changePasswordTitle!
    }
    
    func getThemeTitle() -> XCUIElement {
        self.themeTitle = app.staticTexts[S.themeTitle]
        return themeTitle!
    }
    
    func getThemeDesc() -> XCUIElement {
        self.themeDesc = app.staticTexts[S.themeDesc]
        return themeDesc!
    }
    
    func getThemeValue(value: String) -> XCUIElement {
        self.themeValue = app.staticTexts[value]
        return themeValue!
    }
    
    func getDeleteAccTitle() -> XCUIElement {
        self.deleteAccTitle = app.staticTexts[S.deleteAccTitle]
        return deleteAccTitle!
    }
}
