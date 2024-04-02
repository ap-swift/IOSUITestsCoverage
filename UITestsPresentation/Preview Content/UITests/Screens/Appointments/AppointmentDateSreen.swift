//
//  AppointmentDateSreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 02.02.2024.
//

import XCTest

private typealias S = AppointmentDateScreenSelector
private typealias ENV = UITestEnvConfig

final class AppointmentDateSreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var appointmentTitle: XCUIElement?
    private var clinicTitle: XCUIElement?
    
    private var dayTitle: XCUIElement?
    private var timeTitle: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getAppointmentTitle() -> XCUIElement {
        self.appointmentTitle = app.cells.allElementsBoundByIndex[0].staticTexts.allElementsBoundByIndex[1]
        return appointmentTitle!
    }
    
    func getClinicTitle() -> XCUIElement {
        self.clinicTitle = app.cells.allElementsBoundByIndex[0].staticTexts.firstMatch
        return clinicTitle!
    }
    
    func getDayTitle(index: Int) -> XCUIElement {
        self.dayTitle = app.cells.allElementsBoundByIndex[1].staticTexts.allElementsBoundByIndex[index]
        return dayTitle!
    }
    
    func getFirstTimeTitle() -> XCUIElement {
        self.timeTitle = app.cells.allElementsBoundByIndex[3].staticTexts.allElementsBoundByIndex.last
        return timeTitle!
    }
    
    func getLastTimeTitle() -> XCUIElement {
        self.timeTitle = app.cells.allElementsBoundByIndex.last?.staticTexts.allElementsBoundByIndex.last
        return timeTitle!
    }
}
