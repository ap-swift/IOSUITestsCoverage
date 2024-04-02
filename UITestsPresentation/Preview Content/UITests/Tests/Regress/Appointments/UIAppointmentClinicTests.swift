//
//  UIAppointmentClinicTest.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

final class UIAppointmentClinicTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Appointment Clinic")
    }
    
    private let appointmentClinicTestData = AppointmentClinicTestData(
        specialization: AppointmentClinicTestData.specializationValue,
        doctorName: AppointmentClinicTestData.doctorNameValue,
        doctorSpecialization: AppointmentClinicTestData.doctorSpecializationValue,
        patient: AppointmentClinicTestData.patientValue,
        clinic: AppointmentClinicTestData.clinicValue,
        clinicAddress: AppointmentClinicTestData.clinicAddressValue,
        clinicTime: AppointmentClinicTestData.clinicTimeValue
    )
    
    func testClinicAppointment() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
            .goToClinicAdmission()
            .chooseClinicSpecialization(index: 0)
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getAppointmentClinicHelper()
            .chooseClinicFirstDate()
            .checkConfirmAppointmentClinicScreen(testData: appointmentClinicTestData)
        
        //TODO: check success screen
    }
    
    func testClinicAppointmentFromSpecialization() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getCommonHelper()
            .longSwipeUp()
        
        h.getAppointmentsHelper()
            .goToAllSpecializations()
            .chooseClinicSpecialization(index: 0)
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getAppointmentClinicHelper()
            .chooseClinicFirstDate()
            .checkConfirmAppointmentClinicScreen(testData: appointmentClinicTestData)
        
        //TODO: check success screen
    }
    
    func testClinicAppointmentFromMainPage() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToAppointment()
        
        h.getAppointmentsHelper()
            .confirmCity()
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getCommonHelper()
            .longSwipeUp()
            .longSwipeUp()
        
        h.getAppointmentsHelper()
            .goToAllClinics()
        
        h.getAppointmentClinicHelper()
            .searchClinic(testData: appointmentClinicTestData)
            .checkClinicScreen(testData: appointmentClinicTestData)
        
        h.getAppointmentsHelper()
            .chooseClinicSpecialization(index: 0)
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getAppointmentClinicHelper()
            .chooseClinicFirstDate()
            .checkConfirmAppointmentClinicScreen(testData: appointmentClinicTestData)
        
        /* TODO: cancel all appointments before test and after check success screen
         
         h.getAppointmentClinicHelper()
         .checkSuccessAppointmentClinicScreen(testData: appointmentClinicTestData)
         */
    }
}
