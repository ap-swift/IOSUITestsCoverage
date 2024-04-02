//
//  File.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

final class UIAppointmentsTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Appointments")
    }
    
    func testQuickAppointment() {
        let onlineConsultationTestData = OnlineConsultationTestData(
            patient: OnlineConsultationTestData.patientValue,
            service: OnlineConsultationTestData.serviceValue,
            specialization: OnlineConsultationTestData.specializationValue,
            doctor: OnlineConsultationTestData.doctorValue,
            total: OnlineConsultationTestData.totalValue
        )
        
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
            .goToOnliceConsultation()
            .chooseSpecialization(index: 0)
            .confirmAttentionScreen()
            .checkConfirmationScreen()
            .tapOnPayButton()
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getAppointmentsHelper()
            .checkAppointmentSuccessScreen(testData: onlineConsultationTestData)
        
        h.getChatScreenHelper()
            .checkChatWithDoctor()
    }
    
    func testHomeAppointment() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
            .goToCallingAtHome()
        
        h.getAppointmentClinicHelper()
            .checkAppointmentAddressScreen()
        
        h.getAppointmentsHelper()
            .chooseService(index: 0)
        
        h.getAppointmentClinicHelper()
            .fillingApplication()
        
        h.getAppointmentsHelper()
            .checkConfirmationHomeCall()
            .checkSuccessHomeCall()
        
        h.getCommonHelper()
            .checkMainScreenButton()
    }
    
    func testDiagnosticAppointment() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
            .goToDiagnostic()
            .selectDiagnostic(index: 0)
            .selectDiagnostic(index: 0)
        
        h.getAppointmentClinicHelper()
            .selectClinic(index: 0)
            .chooseClinicLastDate()
            .checkConfirmAppointmentScreen()
        
        h.getAppointmentsHelper()
            .approveDiagnosticRecord()
        
        //TODO: check success screen
    }
}
