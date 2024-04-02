//
//  AppointmentClinicsScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 05.02.2024.
//

import XCTest

private typealias S = AppointmentClinicsSelector
private typealias ENV = UITestEnvConfig

final class AppointmentClinicsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var clinicsList: XCUIElement?
    private var clinicSearchClinicName: XCUIElement?
    
    private var clinicTitle: XCUIElement?
    private var clinicButton: XCUIElement?
    
    private var continueButton: XCUIElement?
    
    func getClinicsList() -> XCUIElement {
        self.clinicsList = app.buttons[S.clinicsList]
        XCTAssertTrue(clinicsList!.waitForHittable(timeout: ENV.timeout))
        return clinicsList!
    }
    
    func getClinicSearchClinicName() -> XCUIElement {
        self.clinicSearchClinicName = app.searchFields[S.clinicSearchClinicName].firstMatch
        return clinicSearchClinicName!
    }
    
    func getClinicTitle(index: Int) -> XCUIElement {
        self.clinicTitle = app.cells.allElementsBoundByIndex[index].staticTexts.element
        return clinicTitle!
    }
    
    func getClinicButton(index: Int) -> XCUIElement {
        self.clinicButton = app.cells.allElementsBoundByIndex[index].buttons.element
        return clinicButton!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons[S.continueButton]
        return continueButton!
    }
}
