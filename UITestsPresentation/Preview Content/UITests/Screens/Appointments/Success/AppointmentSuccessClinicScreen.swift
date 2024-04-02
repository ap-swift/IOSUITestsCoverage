//
//  AppointmentSuccessClinicScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 08.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = AppointmentSuccessClinicSelector

final class AppointmentSuccessClinicScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var reminderButton: XCUIElement?
    
    private var confirmTitle: XCUIElement?
    private var notPaidTitle: XCUIElement?
    private var payButton: XCUIElement?
    
    private var notPaidCabinetTitle: XCUIElement?
    
    private var detailsClinitRecordTitle: XCUIElement?
    private var approveRecordDoctorSpecialization: XCUIElement?
    private var approveRecordDoctorSpecializationValue: XCUIElement?
    private var doctorTitle: XCUIElement?
    private var doctorDesc: XCUIElement?
    private var approveRecordPatientName: XCUIElement?
    private var approveRecordPatientValue: XCUIElement?
    private var approveRecordPremiumReception: XCUIElement?
    private var approveRecordPremiumReceptionValue: XCUIElement?
    private var approveRecordClinicTimeInfo: XCUIElement?
    private var appointmentDetailsDateTitle: XCUIElement?
    private var appointmentDetailsDateTitleValue: XCUIElement?
    private var appointmentDetailsPriceTitle: XCUIElement?
    private var appointmentDetailsPriceValue: XCUIElement?
    private var clinicName: XCUIElement?
    private var clinicAddress: XCUIElement?
    private var newApproveRecordCancel: XCUIElement?
    
    private func getTemplateField(type: String) -> XCUIElement {
        return app.cells.containing(.staticText, identifier:type).children(matching: .staticText).firstMatch
    }
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getReminderButton() -> XCUIElement {
        self.reminderButton = app.buttons[S.reminderButton]
        return reminderButton!
    }
    
    func getConfirmTitle() -> XCUIElement {
        self.confirmTitle = app.staticTexts[S.confirmTitle]
        return confirmTitle!
    }
    
    func getNotPaidTitle() -> XCUIElement {
        self.notPaidTitle = app.staticTexts[S.notPaidTitle]
        return notPaidTitle!
    }
    
    func getPayButton() -> XCUIElement {
        self.payButton = app.cells.buttons.firstMatch
        return payButton!
    }
    
    func getNotPaidCabinetTitle() -> XCUIElement {
        self.notPaidCabinetTitle = app.staticTexts[S.notPaidCabinetTitle]
        return notPaidCabinetTitle!
    }
    
    func getDetailsClinitRecordTitle() -> XCUIElement {
        self.detailsClinitRecordTitle = app.staticTexts[S.detailsClinitRecordTitle]
        return detailsClinitRecordTitle!
    }
    
    func getApproveRecordDoctorSpecialization() -> XCUIElement {
        self.approveRecordDoctorSpecialization = app.staticTexts[S.approveRecordDoctorSpecialization]
        return approveRecordDoctorSpecialization!
    }
    
    func getApproveRecordDoctorSpecializationValue() -> XCUIElement {
        self.approveRecordDoctorSpecializationValue = getTemplateField(type: S.approveRecordDoctorSpecialization)
        return approveRecordDoctorSpecializationValue!
    }
    
    func getDoctorTitle(text: String) -> XCUIElement {
        self.doctorTitle = app.staticTexts[text]
        return doctorTitle!
    }
    
    func getDoctorDesc(text: String) -> XCUIElement {
        self.doctorDesc = app.staticTexts[text]
        return doctorDesc!
    }
    
    func getApproveRecordPatientName() -> XCUIElement {
        self.approveRecordPatientName = app.staticTexts[S.approveRecordPatientName]
        return approveRecordPatientName!
    }
    
    func getApproveRecordPatientValue() -> XCUIElement {
        self.approveRecordPatientValue = getTemplateField(type: S.approveRecordPatientName)
        return approveRecordPatientValue!
    }
    
    func getApproveRecordPremiumReception() -> XCUIElement {
        self.approveRecordPremiumReception = app.staticTexts[S.approveRecordPremiumReception]
        return approveRecordPremiumReception!
    }
    
    func getApproveRecordPremiumReceptionValue() -> XCUIElement {
        self.approveRecordPremiumReceptionValue = getTemplateField(type: S.approveRecordPremiumReception)
        return approveRecordPremiumReceptionValue!
    }
    
    func getApproveRecordClinicTimeInfo() -> XCUIElement {
        self.approveRecordClinicTimeInfo = app.staticTexts[S.approveRecordClinicTimeInfo]
        return approveRecordClinicTimeInfo!
    }
    
    func getAppointmentDetailsDateTitle() -> XCUIElement {
        self.appointmentDetailsDateTitle = app.staticTexts[S.appointmentDetailsDateTitle]
        return appointmentDetailsDateTitle!
    }
    
    func getAppointmentDetailsDateTitleValue() -> XCUIElement {
        self.appointmentDetailsDateTitleValue = getTemplateField(type: S.appointmentDetailsDateTitle)
        return appointmentDetailsDateTitleValue!
    }
    
    func getAppointmentDetailsPriceTitle() -> XCUIElement {
        self.appointmentDetailsPriceTitle = app.staticTexts[S.appointmentDetailsPriceTitle]
        return appointmentDetailsPriceTitle!
    }
    
    func getAppointmentDetailsPriceValue() -> XCUIElement {
        self.appointmentDetailsPriceValue = getTemplateField(type: S.appointmentDetailsPriceTitle)
        return appointmentDetailsPriceValue!
    }
    
    func getClinicName(text: String) -> XCUIElement {
        self.clinicName = app.staticTexts[text]
        return clinicName!
    }
    
    func getClinicAddress(text: String) -> XCUIElement {
        self.clinicAddress = app.staticTexts[text]
        return clinicAddress!
    }
    
    func getNewApproveRecordCancel() -> XCUIElement {
        self.newApproveRecordCancel = app.cells.buttons.allElementsBoundByIndex.last
        return newApproveRecordCancel!
    }
    
    func getNewApproveRecordCancelConfirm() -> XCUIElement {
        self.newApproveRecordCancel = app.buttons[S.newApproveRecordCancel]
        return newApproveRecordCancel!
    }
}
