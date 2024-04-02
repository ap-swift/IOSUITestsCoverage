//
//  RegistrationUserTypeScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 23.01.2024.
//

import XCTest
private typealias S = RegistrationUserTypeSelector
private typealias ENV = UITestEnvConfig

final class RegistrationUserTypeScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    // header
    private var pageTitle: XCUIElement?
    
    // types
    private var newClientTitle: XCUIElement?
    private var newClientDesc: XCUIElement?
    
    private var oldClientTitle: XCUIElement?
    private var oldClientDesc: XCUIElement?
    
    private var dmsClientTitle: XCUIElement?
    private var dmsClientDesc: XCUIElement?
    
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getNewClientTitle() -> XCUIElement {
        self.newClientTitle = app.staticTexts[S.newClientTitle]
        XCTAssertTrue(newClientTitle!.waitForHittable(timeout: ENV.timeout))
        return newClientTitle!
    }
    
    func getNewClientDesc() -> XCUIElement {
        self.newClientDesc = app.staticTexts[S.newClientDesc]
        return newClientDesc!
    }
    
    func getOldClientTitle() -> XCUIElement {
        self.oldClientTitle = app.staticTexts[S.oldClientTitle]
        XCTAssertTrue(oldClientTitle!.waitForHittable(timeout: ENV.timeout))
        return oldClientTitle!
    }
    
    func getOldClientDesc() -> XCUIElement {
        self.oldClientDesc = app.staticTexts[S.oldClientDesc]
        return oldClientDesc!
    }
    
    func getDmsClientTitle() -> XCUIElement {
        self.dmsClientTitle = app.staticTexts[S.dmsClientTitle]
        XCTAssertTrue(dmsClientTitle!.waitForHittable(timeout: ENV.timeout))
        return dmsClientTitle!
    }
    
    func getDmsClientDesc() -> XCUIElement {
        self.dmsClientDesc = app.staticTexts[S.dmsClientDesc]
        return dmsClientDesc!
    }
}
