//
//  NotificationsScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 31.01.2024.
//

import XCTest
private typealias S = NotificationsScreenSelector
private typealias ENV = UITestEnvConfig

final class NotificationsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    
    private var promoTitle: XCUIElement?
    private var promoDesc: XCUIElement?
    private var promoSwitcher: XCUIElement?
    
    private var completeTitle: XCUIElement?
    private var completeDesc: XCUIElement?
    private var completeValue: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getPromoTitle() -> XCUIElement {
        self.promoTitle = app.staticTexts[S.promoTitle]
        return promoTitle!
    }
    
    func getPromoDesc() -> XCUIElement {
        self.promoDesc = app.staticTexts[S.promoDesc]
        return promoDesc!
    }
    
    func getPromoSwitcher() -> XCUIElement {
        self.promoSwitcher = app.switches.firstMatch
        return promoSwitcher!
    }
    
    func getCompleteTitle() -> XCUIElement {
        self.completeTitle = app.staticTexts[S.completeTitle]
        return completeTitle!
    }
    
    func getCompleteDesc() -> XCUIElement {
        self.completeDesc = app.staticTexts[S.completeDesc]
        return completeDesc!
    }
    
    func getCompleteValue(value: String) -> XCUIElement {
        self.completeValue = app.staticTexts[value]
        return completeValue!
    }
}
