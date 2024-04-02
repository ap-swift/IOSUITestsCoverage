//
//  DoctorsScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

import XCTest

private typealias S = DoctorsScreenSelector
private typealias ENV = UITestEnvConfig

final class DoctorsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var dashboardDoctors: XCUIElement?
    private var fullNameDoctor: XCUIElement?
    private var searchElement: XCUIElement?
    
    private var doctorName: XCUIElement?
    private var doctorSpecialization: XCUIElement?
    private var doctorClinic: XCUIElement?
    
    func getDashboardDoctors() -> XCUIElement {
        self.dashboardDoctors = app.staticTexts[S.dashboardDoctors]
        return dashboardDoctors!
    }
    
    func getFullNameDoctor() -> XCUIElement {
        self.fullNameDoctor = app.searchFields[S.fullNameDoctor]
        return fullNameDoctor!
    }
    
    func getSearchElement() -> XCUIElement {
        self.searchElement = app.cells.staticTexts.element
        return searchElement!
    }
    
    func getDoctorName(index: Int) -> XCUIElement {
        self.doctorName = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[2]
        return doctorName!
    }
    
    func getDoctorSpecialization(index: Int) -> XCUIElement {
        self.doctorSpecialization = app.cells.allElementsBoundByIndex[index].staticTexts.firstMatch
        return doctorSpecialization!
    }
    
    func getDoctorClinic(index: Int) -> XCUIElement {
        self.doctorClinic = app.cells.allElementsBoundByIndex[index].staticTexts.allElementsBoundByIndex[1]
        return doctorClinic!
    }
}
