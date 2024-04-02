//
//  AppointmentConfirmationScerenswift.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentConfirmationScreenSelector

final class AppointmentConfirmationScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var pageSubtitle: XCUIElement?
    
    private var patientTitle: XCUIElement?
    private var patientValue: XCUIElement?
    
    private var serviceTitle: XCUIElement?
    private var serviceValue: XCUIElement?
    
    private var specializationTitle: XCUIElement?
    private var specializationValue: XCUIElement?
    
    private var doctorTitle: XCUIElement?
    private var doctorValue: XCUIElement?
    
    private var paymentMethodTitle: XCUIElement?
    
    private var totalTitle: XCUIElement?
    private var totalInformationButton: XCUIElement?
    private var totalValue: XCUIElement?
    
    private var offerCheckBox: XCUIElement?
    private var offerTitle: XCUIElement?
    private var offerButton: XCUIElement?
    
    private var payButton: XCUIElement?
    
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
    
    func getPatientTitle() -> XCUIElement {
        self.patientTitle = app.staticTexts[S.patientTitle]
        return patientTitle!
    }
    
    func getPatientValue() -> XCUIElement {
        self.patientTitle = getTemplateField(type: S.patientTitle)
        return patientTitle!
    }
    
    func getServiceTitle() -> XCUIElement {
        self.serviceTitle = app.staticTexts[S.serviceTitle]
        return serviceTitle!
    }
    
    func getServiceValue() -> XCUIElement {
        self.serviceValue = getTemplateField(type: S.serviceTitle)
        return serviceValue!
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
        self.doctorTitle = app.staticTexts[S.doctorTitle]
        return doctorTitle!
    }
    
    func getDoctorValue() -> XCUIElement {
        self.doctorValue = getTemplateField(type: S.doctorTitle)
        return doctorValue!
    }
    
    func getPaymentMethodTitle() -> XCUIElement {
        self.paymentMethodTitle = app.staticTexts[S.paymentMethodTitle]
        return paymentMethodTitle!
    }
    
    func getTotalTitle() -> XCUIElement {
        self.totalTitle = app.staticTexts[S.totalTitle]
        return totalTitle!
    }
    
    func getTotalInformationButton() -> XCUIElement {
        self.totalInformationButton = app.cells.containing(.staticText, identifier: S.totalTitle).children(matching: .button).element
        return totalInformationButton!
    }
    
    func getTotalValue() -> XCUIElement {
        self.totalValue = app.cells.containing(.staticText, identifier: S.totalTitle).children(matching: .staticText).allElementsBoundByIndex[1]
        return totalValue!
    }
    
    func getOfferTitle() -> XCUIElement {
        self.offerTitle = app.staticTexts[S.offerTitle]
        return offerTitle!
    }
    
    func getOfferCheckbox() -> XCUIElement {
        self.offerCheckBox = app.cells.containing(.staticText, identifier: S.offerTitle).children(matching: .button).allElementsBoundByIndex[1]
        return offerCheckBox!
    }
    
    func getOfferButton() -> XCUIElement {
        self.offerButton = app.cells.containing(.staticText, identifier: S.offerTitle).children(matching: .button).allElementsBoundByIndex[0]
        return offerButton!
    }
    
    func getPayButton() -> XCUIElement {
        self.payButton = app.buttons[S.payButton]
        XCTAssertTrue(payButton!.waitForHittable(timeout: ENV.timeout))
        return payButton!
    }
}
