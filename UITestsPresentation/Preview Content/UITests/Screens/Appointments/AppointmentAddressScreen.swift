//
//  AppointmentAddressScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 02.02.2024.
//

import XCTest

private typealias S = AppointmentAddressSelector
private typealias ENV = UITestEnvConfig

final class AppointmentAddressScreen {
    private let app: XCUIApplication = XCUIApplication()


    private var pageTitle: XCUIElement?
    private var currentAddressTitle: XCUIElement?
    private var currentAddressValue: XCUIElement?
    
    private var differentAddressButton: XCUIElement?
    private var serviceButton: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getCurrentAddressTitle() -> XCUIElement {
        self.currentAddressTitle = app.staticTexts[S.currentAddressTitle]
        return currentAddressTitle!
    }
    
    func getCurrentAddressValue() -> XCUIElement {
        self.currentAddressValue = app.staticTexts.allElementsBoundByIndex.last
        return currentAddressValue!
    }
    
    func getDifferentAddressButton() -> XCUIElement {
        self.differentAddressButton = app.buttons[S.differentAddressButton]
        return differentAddressButton!
    }
    
    func getServiceButton() -> XCUIElement {
        self.serviceButton = app.buttons[S.serviceButton]
        return serviceButton!
    }
}
