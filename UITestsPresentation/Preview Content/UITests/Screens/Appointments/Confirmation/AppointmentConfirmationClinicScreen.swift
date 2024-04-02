//
//  AppointmentConfirmationClinicScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 02.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentConfirmationClinicSelector

final class AppointmentConfirmationClinicScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var pageSubtitle: XCUIElement?
    
    private var mapTitle: XCUIElement?
    
    private var specializationTitle: XCUIElement?
    private var specializationValue: XCUIElement?
    
    private var doctorTitle: XCUIElement?
    private var doctorValue: XCUIElement?
    
    private var patientTitle: XCUIElement?
    private var patientValue: XCUIElement?
    
    private var dateTitle: XCUIElement?
    private var dateValue: XCUIElement?
    
    private var clinicTitle: XCUIElement?
    private var clinicValue: XCUIElement?
    
    private var clinicAddressTitle: XCUIElement?
    private var clinicAddressValue: XCUIElement?
    
    private var priceTitle: XCUIElement?
    private var priceValue: XCUIElement?
    
    private var continueButton: XCUIElement?
    
    private func getTemplateField(type: String) -> XCUIElement {
        return app.cells.containing(.staticText, identifier:type).children(matching: .staticText).firstMatch
    }
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars.staticTexts.element
        return pageTitle!
    }
    
    func getPageSubtitle() -> XCUIElement {
        self.pageSubtitle = app.staticTexts[S.pageSubtitle]
        return pageSubtitle!
    }
    
    func getMapTitle() -> XCUIElement {
        self.mapTitle = app.staticTexts[S.mapTitle]
        return mapTitle!
    }
    
    func getSpecializationTitle() -> XCUIElement {
        self.specializationTitle = app.staticTexts[S.specializationTitle]
        return specializationTitle!
    }
    
    func getSpecializationValue() -> XCUIElement {
        self.specializationValue = getTemplateField(type: S.specializationTitle)
        return specializationValue!
    }
    
    func getDoctorTitle() -> XCUIElement {
        self.doctorTitle = app.cells.allElementsBoundByIndex[2].staticTexts.firstMatch
        return doctorTitle!
    }
    
    func getDoctorValue() -> XCUIElement {
        self.doctorValue = app.cells.allElementsBoundByIndex[2].staticTexts.allElementsBoundByIndex[1]
        return doctorValue!
    }
    
    func getPatientTitle() -> XCUIElement {
        self.patientTitle = app.staticTexts[S.patientTitle]
        return patientTitle!
    }
    
    func getPatientValue() -> XCUIElement {
        self.patientTitle = getTemplateField(type: S.patientTitle)
        return patientTitle!
    }
    
    func getDateTitle() -> XCUIElement {
        self.dateTitle = app.staticTexts[S.dateTitle]
        return dateTitle!
    }
    
    func getDateValue() -> XCUIElement {
        self.dateValue = getTemplateField(type: S.dateTitle)
        return dateValue!
    }
    
    func getClinicTitle() -> XCUIElement {
        self.clinicTitle = app.staticTexts[S.clinicTitle]
        return clinicTitle!
    }
    
    func getClinicValue() -> XCUIElement {
        self.clinicValue = getTemplateField(type: S.clinicTitle)
        return clinicValue!
    }
    
    func getClinicAddressTitle() -> XCUIElement {
        self.clinicAddressTitle = app.staticTexts[S.clinicAddressTitle]
        return clinicAddressTitle!
    }
    
    func getClinicAddressValue() -> XCUIElement {
        self.clinicAddressValue = getTemplateField(type: S.clinicAddressTitle)
        return clinicAddressValue!
    }
    
    func getPriceTitle() -> XCUIElement {
        self.priceTitle = app.staticTexts[S.priceTitle]
        return priceTitle!
    }
    
    func getPriceValue() -> XCUIElement {
        self.priceValue = getTemplateField(type: S.priceTitle)
        return priceValue!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons[S.continueButton]
        return continueButton!
    }
    
    func getApproveRecordDiagnosticsButtonText() -> XCUIElement {
        self.continueButton = app.buttons[S.approveRecordDiagnosticsButtonText]
        return continueButton!
    }
}
