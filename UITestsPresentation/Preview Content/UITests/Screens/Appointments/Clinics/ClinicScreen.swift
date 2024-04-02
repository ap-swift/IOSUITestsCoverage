//
//  ClinicScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 08.02.2024.
//

import XCTest

private typealias S = AppointmentClinicsSelector
private typealias ENV = UITestEnvConfig

final class ClinicScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var clinicTitle: XCUIElement?
    private var clinicShareButton: XCUIElement?
    
    private var clinicName: XCUIElement?
    private var clinicAddress: XCUIElement?
    private var clinicTime: XCUIElement?
    private var clinicImage: XCUIElement?
    
    private var clinicMakeAppointment: XCUIElement?
    
    func getClinicTitle() -> XCUIElement {
        self.clinicTitle = app.staticTexts[S.clinicTitle]
        return clinicTitle!
    }
    
    func getClinicShareButton() -> XCUIElement {
        self.clinicShareButton = app.buttons[S.clinicShareButton]
        return clinicShareButton!
    }
    
    func getClinicName(text: String) -> XCUIElement {
        self.clinicName = app.staticTexts[text]
        return clinicName!
    }
    
    func getClinicAddress(text: String) -> XCUIElement {
        self.clinicAddress = app.staticTexts[text]
        return clinicAddress!
    }
    
    func getClinicTime(text: String) -> XCUIElement {
        self.clinicTime = app.staticTexts[text]
        return clinicTime!
    }
    
    func getClinicImage() -> XCUIElement {
        self.clinicImage = app.images.element
        return clinicImage!
    }
    
    func getClinicMakeAppointment() -> XCUIElement {
        self.clinicMakeAppointment = app.buttons[S.clinicMakeAppointment]
        return clinicMakeAppointment!
    }
}
