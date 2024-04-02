//
//  ThanksScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 24.01.2024.
//

import XCTest
private typealias S = ThanksScreenSelector
private typealias ENV = UITestEnvConfig

final class ThanksScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var backButton: XCUIElement?
    private var programText: XCUIElement?
    private var programButton: XCUIElement?
    
    private var webViewTitle: XCUIElement?
    private var webViewDoneButton: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getBackButton() -> XCUIElement {
        self.backButton = app.buttons[S.backButton]
        return backButton!
    }
    
    func getProgramText(index: Int) -> XCUIElement {
        self.programText = app.otherElements.staticTexts.allElementsBoundByIndex[index]
        return programText!
    }
    
    func getProgramButton() -> XCUIElement {
        self.programButton = app.buttons[S.programButton]
        return programButton!
    }
    
    func getWebViewTitle() -> XCUIElement {
        self.webViewTitle = app.buttons[S.webViewUrl]
        return webViewTitle!
    }
    
    func getWebViewDoneButton() -> XCUIElement {
        self.webViewDoneButton = app.buttons[S.doneButton]
        return webViewDoneButton!
    }
}
