//
//  UIAppointmentDoctorTests.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

final class UIAppointmentDoctorTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Appointment Doctors")
    }
    
    private let doctorTestData = DoctorTestData(
        doctorName: DoctorTestData.doctorNameValue,
        doctorDesc: DoctorTestData.doctorDescValue,
        doctorSpecialization: DoctorTestData.doctorSpecializationValue,
        clinicName: DoctorTestData.clinicNameValue,
        clinicAddress: DoctorTestData.clinicAddressValue
    )
    
    func testDoctorDetails() {
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
            .goToAllDoctors()
        
        h.getDoctorsHelper()
            .searchDoctor(value: doctorTestData.doctorName)
            .checkDoctorScreen(testData: doctorTestData)
    }
    
    func testDoctorAppointment() {
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
            .swipeUp()
        
        h.getAppointmentsHelper()
            .goToAllDoctors()
        
        h.getDoctorsHelper()
            .searchDoctor(value: doctorTestData.doctorName)
            .goToDoctorClinic()
        
        h.getAppointmentClinicHelper()
            .chooseClinicLastDate()
            .chooseClinicLastDate()
            .checkConfirmAppointmentScreen()
            .approveClinicRecord()
        
        //TODO: check success screen
    }
}
