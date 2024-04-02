//
//  AppointmentConfirmationHomeScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 05.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentConfirmationHomeSelector

final class AppointmentConfirmationHomeScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var approveHomeCallNavigationTitle: XCUIElement?
    
    private var homeCallPatient: XCUIElement?
    private var homeCallPatientValue: XCUIElement?
    
    private var homeCallContactPhone: XCUIElement?
    private var homeCallContactPhoneValue: XCUIElement?
    
    private var homeCallAppointmentDate: XCUIElement?
    private var homeCallAppointmentDateValue: XCUIElement?
    
    private var homeCallAddress: XCUIElement?
    private var homeCallAddressValue: XCUIElement?
    
    private var homeCallComplaints: XCUIElement?
    private var homeCallComplaintsValue: XCUIElement?
    
    private var homeCallChoosenServices: XCUIElement?
    private var homeCallChoosenServiceTitle: XCUIElement?
    private var homeCallChoosenServicesAmount: XCUIElement?
    private var homeCallChoosenServicesIndex: XCUIElement?
    
    private var homeCallPaymentMethod: XCUIElement?
    private var homeCallByCardOrInCashToDoctor: XCUIElement?
    
    private var homeCallMakeAppointment: XCUIElement?
    
    private func getTemplateField(type: String) -> XCUIElement {
        return app.cells.containing(.staticText, identifier:type).children(matching: .staticText).firstMatch
    }
    
    func getApproveHomeCallNavigationTitle() -> XCUIElement {
        self.approveHomeCallNavigationTitle = app.staticTexts[S.approveHomeCallNavigationTitle]
        return approveHomeCallNavigationTitle!
    }
    
    func getHomeCallPatient() -> XCUIElement {
        self.homeCallPatient = app.staticTexts[S.homeCallPatient]
        return homeCallPatient!
    }
    
    func getHomeCallPatientValue() -> XCUIElement {
        self.homeCallPatientValue = getTemplateField(type: S.homeCallPatient)
        return homeCallPatientValue!
    }
    
    func getHomeCallContactPhone() -> XCUIElement {
        self.homeCallContactPhone = app.staticTexts[S.homeCallContactPhone]
        return homeCallContactPhone!
    }
    
    func getHomeCallContactPhoneValue() -> XCUIElement {
        self.homeCallContactPhoneValue = getTemplateField(type: S.homeCallContactPhone)
        return homeCallContactPhoneValue!
    }
    
    func getHomeCallAppointmentDate() -> XCUIElement {
        self.homeCallAppointmentDate = app.staticTexts[S.homeCallAppointmentDate]
        return homeCallAppointmentDate!
    }
    
    func getHomeCallAppointmentDateValue() -> XCUIElement {
        self.homeCallAppointmentDateValue = getTemplateField(type: S.homeCallAppointmentDate)
        return homeCallAppointmentDateValue!
    }
    
    func getHomeCallAddress() -> XCUIElement {
        self.homeCallAddress = app.staticTexts[S.homeCallAddress]
        return homeCallAddress!
    }
    
    func getHomeCallAddressValue() -> XCUIElement {
        self.homeCallAddressValue = getTemplateField(type: S.homeCallAddress)
        return homeCallAddressValue!
    }
    
    func getHomeCallComplaints() -> XCUIElement {
        self.homeCallComplaints = app.staticTexts[S.homeCallComplaints]
        return homeCallComplaints!
    }
    
    func getHomeCallComplaintsValue() -> XCUIElement {
        self.homeCallComplaintsValue = getTemplateField(type: S.homeCallComplaints)
        return homeCallComplaintsValue!
    }
    
    func getHomeCallChoosenServices() -> XCUIElement {
        self.homeCallChoosenServices = app.staticTexts[S.homeCallChoosenServices]
        return homeCallChoosenServices!
    }
    
    func getHomeCallChoosenServiceTitle() -> XCUIElement {
        self.homeCallChoosenServiceTitle = app.cells.containing(.button, identifier:S.homeCallChoosenServicesTitle).children(matching: .staticText).firstMatch
        return homeCallChoosenServiceTitle!
    }
    
    func getHomeCallChoosenServiceAmount() -> XCUIElement {
        self.homeCallChoosenServicesAmount = app.cells.containing(.button, identifier:S.homeCallChoosenServicesTitle).children(matching: .staticText).allElementsBoundByIndex[1]
        return homeCallChoosenServicesAmount!
    }
    
    func getHomeCallChoosenServiceIndex() -> XCUIElement {
        self.homeCallChoosenServicesIndex = app.cells.containing(.button, identifier:S.homeCallChoosenServicesTitle).children(matching: .staticText).allElementsBoundByIndex[2]
        return homeCallChoosenServicesIndex!
    }
    
    func getHomeCallPaymentMethod() -> XCUIElement {
        self.homeCallPaymentMethod = app.staticTexts[S.homeCallPaymentMethod]
        return homeCallPaymentMethod!
    }
    
    func getHomeCallByCardOrInCashToDoctor() -> XCUIElement {
        self.homeCallByCardOrInCashToDoctor = app.staticTexts[S.homeCallByCardOrInCashToDoctor]
        return homeCallByCardOrInCashToDoctor!
    }
    
    func getHomeCallMakeAppointment() -> XCUIElement {
        self.homeCallMakeAppointment = app.cells.allElementsBoundByIndex.last?.buttons.element
        return homeCallMakeAppointment!
    }
}
