//
//  AppointmentConfirmationHomeScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 05.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentFillingApplicationSelectors

final class AppointmentFillingApplicationHomeScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var homeCallApplication: XCUIElement?
    
    private var homeCallPatient: XCUIElement?
    private var homeCallPatientValue: XCUIElement?
    
    private var homeCallContactPhone: XCUIElement?
    private var homeCallContactPhoneValue: XCUIElement?
    
    private var homeCallPatientIsContactPerson: XCUIElement?
    
    private var homeCallDate: XCUIElement?
    
    private var homeCallSymptoms: XCUIElement?
    
    private var homeCallComplaints: XCUIElement?
    private var homeCallComplaintsField: XCUIElement?
    
    private var homeCallContinue: XCUIElement?
    
    func getHomeCallApplication() -> XCUIElement {
        self.homeCallApplication = app.staticTexts[S.homeCallApplication]
        return homeCallApplication!
    }
    
    func getHomeCallPatient() -> XCUIElement {
        self.homeCallPatient = app.staticTexts[S.homeCallPatient]
        return homeCallPatient!
    }
    
    func getHomeCallPatientValue() -> XCUIElement {
        self.homeCallPatientValue = app.otherElements.containing(.staticText, identifier: S.homeCallPatient).children(matching: .staticText).allElementsBoundByIndex[1]
        return homeCallPatientValue!
    }
    
    func getHomeCallContactPhone() -> XCUIElement {
        self.homeCallContactPhone = app.staticTexts[S.homeCallContactPhone]
        return homeCallContactPhone!
    }
    
    func getHomeCallContactPhoneValue() -> XCUIElement {
        self.homeCallContactPhoneValue = app.otherElements.containing(.staticText, identifier: S.homeCallContactPhone).children(matching: .staticText).allElementsBoundByIndex[1]
        return homeCallContactPhoneValue!
    }
    
    func getHomeCallPatientIsContactPerson() -> XCUIElement {
        self.homeCallPatientIsContactPerson = app.staticTexts[S.homeCallPatientIsContactPerson]
        return homeCallPatientIsContactPerson!
    }
    
    func getHomeCallDate() -> XCUIElement {
        self.homeCallDate = app.staticTexts[S.homeCallDate]
        return homeCallDate!
    }
    
    func getHomeCallSymptoms() -> XCUIElement {
        self.homeCallSymptoms = app.staticTexts[S.homeCallSymptoms]
        return homeCallSymptoms!
    }
    
    func getHomeCallComplaints() -> XCUIElement {
        self.homeCallComplaints = app.staticTexts[S.homeCallComplaints]
        return homeCallComplaints!
    }
    
    func getHomeCallComplaintsField() -> XCUIElement {
        self.homeCallComplaintsField = app.textViews.element
        return homeCallComplaintsField!
    }
    
    func getHomeCallContinue() -> XCUIElement {
        self.homeCallContinue = app.buttons[S.homeCallContinue]
        return homeCallContinue!
    }
}
