//
//  AppountmentSuccessScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentSuccessScreenSelector

final class AppointmentSuccessScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    
    private var patientTitle: XCUIElement?
    private var patientValue: XCUIElement?
    
    private var serviceTitle: XCUIElement?
    private var serviceValue: XCUIElement?
    
    private var specializationTitle: XCUIElement?
    private var specializationValue: XCUIElement?
    
    private var doctorTitle: XCUIElement?
    private var doctorValue: XCUIElement?
    
    private var totalTitle: XCUIElement?
    private var totalValue: XCUIElement?
    
    private var successImage: XCUIElement?
    private var successTitle: XCUIElement?
    
    private var chatButton: XCUIElement?
    
    // home call
    private var paymentStateStatusTitle: XCUIElement?
    private var paymentStateSuccessTitle: XCUIElement?
    private var paymentStateSuccessImage: XCUIElement?
    private var paymentStateSuccessDescription: XCUIElement?
    private var appointmentMoveToConference: XCUIElement?
    private var skiniveBackToDashboard: XCUIElement?
    
    private func getTemplateField(type: String) -> XCUIElement {
        return app.cells.containing(.staticText, identifier:type).children(matching: .staticText).firstMatch
    }
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.statusTitle]
        return pageTitle!
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
    
    func getDoctorTitle() -> XCUIElement {
        self.doctorTitle = app.staticTexts[S.doctorTitle]
        return doctorTitle!
    }
    
    func getDoctorValue() -> XCUIElement {
        self.doctorValue = getTemplateField(type: S.doctorTitle)
        return doctorValue!
    }
    
    func getSpecializationTitle() -> XCUIElement {
        self.specializationTitle = app.staticTexts[S.specializationTitle]
        return specializationTitle!
    }
    
    func getSpecializationValue() -> XCUIElement {
        self.specializationValue = getTemplateField(type: S.specializationTitle)
        return specializationValue!
    }
    
    func getTotalTitle() -> XCUIElement {
        self.totalTitle = app.staticTexts[S.totalTitle]
        return totalTitle!
    }
    
    func getTotalValue() -> XCUIElement {
        self.totalValue = app.cells.containing(.staticText, identifier: S.totalTitle).children(matching: .staticText).allElementsBoundByIndex[1]
        return totalValue!
    }
    
    func getSuccessImage() -> XCUIElement {
        self.successImage = app.cells.containing(.staticText, identifier: S.successTitle).children(matching: .image).element
        return successImage!
    }
    
    func getSuccessTitle() -> XCUIElement {
        self.successTitle = app.staticTexts[S.successTitle]
        return successTitle!
    }
    
    func getChatButton() -> XCUIElement {
        self.chatButton = app.buttons[S.chatButton]
        XCTAssertTrue(chatButton!.waitForHittable(timeout: ENV.timeout))
        return chatButton!
    }
    
    // home call
    func getPaymentStateStatusTitle() -> XCUIElement {
        self.paymentStateStatusTitle = app.staticTexts[S.paymentStateStatusTitle]
        return paymentStateStatusTitle!
    }
    
    func getPaymentStateSuccessTitle() -> XCUIElement {
        self.paymentStateSuccessTitle = app.staticTexts[S.paymentStateSuccessTitle]
        return paymentStateSuccessTitle!
    }
    
    func getPaymentStateSuccessImage() -> XCUIElement {
        self.paymentStateSuccessImage = app.images.firstMatch
        return paymentStateSuccessImage!
    }
    
    func getPaymentStateSuccessDescription() -> XCUIElement {
        self.paymentStateSuccessDescription = app.staticTexts[S.paymentStateSuccessDescription]
        return paymentStateSuccessDescription!
    }
    
    func getAppointmentMoveToConference() -> XCUIElement {
        self.appointmentMoveToConference = app.buttons[S.appointmentMoveToConference]
        return appointmentMoveToConference!
    }
    
    func getSkiniveBackToDashboard() -> XCUIElement {
        self.skiniveBackToDashboard = app.buttons[S.skiniveBackToDashboard]
        return skiniveBackToDashboard!
    }
}
