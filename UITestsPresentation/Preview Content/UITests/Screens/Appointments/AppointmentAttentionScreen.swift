//
//  AppointmentAttentionScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class AppointmentAttentionScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageImage: XCUIElement?
    private var pageTitle: XCUIElement?
    private var pageSubtitle: XCUIElement?
    private var interruptButton: XCUIElement?
    private var continueButton: XCUIElement?
    
    func getPageImage() -> XCUIElement {
        self.pageImage = app.images.element
        return pageImage!
    }
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts.allElementsBoundByIndex[0]
        return pageTitle!
    }
    
    func getPageSubtitle() -> XCUIElement {
        self.pageSubtitle = app.staticTexts.allElementsBoundByIndex[1]
        return pageSubtitle!
    }
    
    func getInterruptButton() -> XCUIElement {
        self.interruptButton = app.buttons.allElementsBoundByIndex[1]
        XCTAssertTrue(interruptButton!.waitForHittable(timeout: ENV.timeout))
        return interruptButton!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons.allElementsBoundByIndex[2]
        XCTAssertTrue(continueButton!.waitForHittable(timeout: ENV.timeout))
        return continueButton!
    }
}
