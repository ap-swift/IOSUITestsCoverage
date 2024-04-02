//
//  AppointmentServiceScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 02.02.2024.
//

import XCTest

private typealias S = AppointmentServiceSelector
private typealias ENV = UITestEnvConfig

final class AppointmentServiceScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var filterButton: XCUIElement?
    private var searchButton: XCUIElement?
    
    private var serviceName: XCUIElement?
    private var servicePrice: XCUIElement?
    private var serviceButton: XCUIElement?
    
    private var totalPrice: XCUIElement?
    private var totalServices: XCUIElement?
    private var continueButton: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getFilterButton() -> XCUIElement {
        self.filterButton = app.buttons[S.filterButton]
        return filterButton!
    }
    
    func getSearchButton() -> XCUIElement {
        self.searchButton = app.buttons[S.searchButton]
        return searchButton!
    }
    
    func getServiceName(index: Int) -> XCUIElement {
        self.serviceName = app.cells.allElementsBoundByIndex[index].staticTexts.firstMatch
        XCTAssertTrue(serviceName!.waitForHittable(timeout: ENV.timeout))
        return serviceName!
    }
    
    func getServicePrice(index: Int) -> XCUIElement {
        self.servicePrice = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[1]
        return servicePrice!
    }
    
    func getServicButton(index: Int) -> XCUIElement {
        self.serviceButton = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[2]
        return serviceButton!
    }
    
    func getTotalPrice() -> XCUIElement {
        self.totalPrice = app
        return totalPrice!
    }
    
    func getTotalServices() -> XCUIElement {
        self.totalServices = app
        return totalServices!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons[S.continueButton]
        return continueButton!
    }
}
