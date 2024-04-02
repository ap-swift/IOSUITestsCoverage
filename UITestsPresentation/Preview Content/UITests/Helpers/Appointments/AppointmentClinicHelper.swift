//
//  AppointmentClinicHelper.swift
//  UITests
//
//  Created by PETROV Vladimir on 08.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class AppointmentClinicHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func chooseClinicFirstDate() -> AppointmentClinicHelper {
        step("Выбор первой доступной даты в клинике") {
            XCTAssertTrue(screens.getAppointmentDateSreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentDateSreen().getClinicTitle().isHittable)
            
            screens.getAppointmentDateSreen().getDayTitle(index: 0).tap()
            screens.getAppointmentDateSreen().getFirstTimeTitle().tap()
        }
        return self
    }
    
    func chooseClinicLastDate() -> AppointmentClinicHelper {
        step("Выбор последней доступной даты в клинике") {
            XCTAssertTrue(screens.getAppointmentDateSreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentDateSreen().getClinicTitle().waitForHittable(timeout: ENV.timeout))
            
            screens.getAppointmentDateSreen().getDayTitle(index: 0).tap()
            screens.getAppointmentDateSreen().getLastTimeTitle().tap()
        }
        return self
    }
    
    func checkConfirmAppointmentClinicScreen(testData: AppointmentClinicTestData) {
        step("Проверка экрана подтверждения записи в клинику") {
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPageSubtitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPageTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getMapTitle().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getSpecializationTitle().isHittable)
            XCTAssertEqual(testData.specialization, screens.getAppointmentConfirmationClinicScreen().getSpecializationValue().label)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDoctorTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDoctorValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPatientTitle().isHittable)
            XCTAssertEqual(testData.patient, screens.getAppointmentConfirmationClinicScreen().getPatientValue().label)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDateTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDateValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicAddressTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicAddressValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPriceTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPriceValue().isHittable)
            
            screens.getAppointmentConfirmationClinicScreen().getContinueButton().tap()
        }
    }
    
    func checkConfirmAppointmentScreen() -> AppointmentClinicHelper {
        step("Проверка экрана подтверждения записи в клинику") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPageSubtitle().waitForHittable(timeout: ENV.timeout))
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDoctorTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPatientTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPatientValue().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDateTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getDateValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicAddressTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getClinicAddressValue().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPriceTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationClinicScreen().getPriceValue().isHittable)
        }
        return self
    }
    
    func approveClinicRecord() {
        step("Подтверждение записи в клинику") {
            screens.getAppointmentConfirmationClinicScreen().getContinueButton().tap()
        }
    }
    
    func checkAppointmentAddressScreen() {
        step("Проверка экрана выбора адреса") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentAddressScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentAddressScreen().getCurrentAddressTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentAddressScreen().getCurrentAddressValue().isHittable)
            XCTAssertTrue(screens.getAppointmentAddressScreen().getDifferentAddressButton().isHittable)
            
            screens.getAppointmentAddressScreen().getServiceButton().tap()
        }
    }
    
    func fillingApplication() {
        step("Провекра экрана оформления заявки") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallApplication().waitForHittable(timeout: ENV.timeout))
            
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallPatient().isHittable)
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallPatientValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallContactPhone().isHittable)
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallContactPhoneValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallPatientIsContactPerson().isHittable)
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallDate().isHittable)
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallSymptoms().isHittable)
            XCTAssertTrue(screens.getAppointmentFillingApplicationHomeScreen().getHomeCallComplaints().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            screens.getAppointmentFillingApplicationHomeScreen().getHomeCallComplaintsField().tap()
            screens.getAppointmentFillingApplicationHomeScreen().getHomeCallComplaintsField().typeText("".randomString(length: 10))
            
            screens.getAppointmentFillingApplicationHomeScreen().getHomeCallContinue().tap()
        }
    }
    
    func selectClinic(index: Int) -> AppointmentClinicHelper {
        step("Выбор клиники из списка") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            
            screens.getAppointmentClinicsScreen().getClinicsList().tap()
            
            XCTAssertTrue(screens.getAppointmentClinicsScreen().getClinicSearchClinicName().isHittable)
            XCTAssertTrue(screens.getAppointmentClinicsScreen().getClinicButton(index: index).isHittable)
            
            screens.getAppointmentClinicsScreen().getClinicTitle(index: index).tap()
            screens.getAppointmentClinicsScreen().getContinueButton().tap()
        }
        return self
    }
    
    func searchClinic(testData: AppointmentClinicTestData) -> AppointmentClinicHelper {
        step("Поиск клиники в списке") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            
            screens.getAppointmentClinicsScreen().getClinicsList().tap()
            XCTAssertTrue(screens.getAppointmentClinicsScreen().getClinicSearchClinicName().isHittable)
            
            screens.getAppointmentClinicsScreen().getClinicSearchClinicName().tap()
            screens.getAppointmentClinicsScreen().getClinicSearchClinicName().typeText(testData.clinic)
            screens.getAppointmentClinicsScreen().getClinicTitle(index: 0).tap()
        }
        return self
    }
    
    func checkClinicScreen(testData: AppointmentClinicTestData) {
        step("Проверка клинки перед записью") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            
            XCTAssertTrue(screens.getClinicScreen().getClinicTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getClinicScreen().getClinicShareButton().isHittable)
            XCTAssertTrue(screens.getClinicScreen().getClinicName(text: testData.clinic).isHittable)
            XCTAssertTrue(screens.getClinicScreen().getClinicAddress(text: "  " + testData.clinicAddress).isHittable)
            XCTAssertTrue(screens.getClinicScreen().getClinicTime(text: testData.clinicTime).isHittable)
            XCTAssertTrue(screens.getClinicScreen().getClinicImage().isHittable)
            
            screens.getClinicScreen().getClinicMakeAppointment().tap()
        }
    }
    
    func checkSuccessAppointmentClinicScreen(testData: AppointmentClinicTestData) {
        step("Проверка экрана успеха записи") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getReminderButton().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getConfirmTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getNotPaidTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getPayButton().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getNotPaidCabinetTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getDetailsClinitRecordTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getApproveRecordDoctorSpecialization().isHittable)
            XCTAssertEqual(testData.specialization, screens.getAppointmentSuccessClinicScreen().getApproveRecordDoctorSpecializationValue().label)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getDoctorTitle(text: testData.doctorName).isHittable)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getApproveRecordPatientName().isHittable)
            XCTAssertEqual(testData.patient, screens.getAppointmentSuccessClinicScreen().getApproveRecordPatientValue().label)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getApproveRecordPremiumReception().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getApproveRecordPremiumReceptionValue().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getApproveRecordClinicTimeInfo().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getAppointmentDetailsDateTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getAppointmentDetailsDateTitleValue().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getAppointmentDetailsPriceTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getAppointmentDetailsPriceValue().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getClinicName(text: testData.clinic).isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getClinicAddress(text: testData.clinicAddress).isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessClinicScreen().getNewApproveRecordCancel().isHittable)
        }
    }
    
    func cancelClinicAppointment() {
        step("Отмена записи на прием") {
            screens.getAppointmentSuccessClinicScreen().getNewApproveRecordCancel().tap()
            screens.getAppointmentSuccessClinicScreen().getNewApproveRecordCancelConfirm().tap()
        }
    }
}
