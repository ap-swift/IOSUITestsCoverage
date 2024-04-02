//
//  OnlineConsultationFirstScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest

private typealias S = AppointmentFirstStepSelector
private typealias ENV = UITestEnvConfig

final class OnlineConsultationFirstScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageSubtitle: XCUIElement?
    private var searchCell: XCUIElement?
    
    private var specializationTitle: XCUIElement?
    private var specializationSubtitle: XCUIElement?
    
    func getPageSubtitle() -> XCUIElement {
        self.pageSubtitle = app.staticTexts[S.pageSubtitle]
        return pageSubtitle!
    }
    
    func getSpecializationTitle(index: Int) -> XCUIElement {
        self.specializationTitle = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[1]
        XCTAssertTrue(specializationTitle!.waitForHittable(timeout: ENV.timeout))
        return specializationTitle!
    }
    
    func getClinicSpecializationTitle(index: Int) -> XCUIElement {
        self.specializationTitle = app.cells.allElementsBoundByIndex[index].staticTexts.element
        XCTAssertTrue(specializationTitle!.waitForHittable(timeout: ENV.timeout))
        return specializationTitle!
    }
    
    func getSpecializationSubtitle(index: Int) -> XCUIElement {
        self.specializationSubtitle = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[0]
        XCTAssertTrue(specializationSubtitle!.waitForHittable(timeout: ENV.timeout))
        return specializationSubtitle!
    }
}
