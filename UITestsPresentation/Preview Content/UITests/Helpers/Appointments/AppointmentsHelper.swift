//
//  AppointmentsHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class AppointmentsHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func goToOnliceConsultation() -> AppointmentsHelper {
        step("Переход в раздел 'Онлайн-консультация'") {
            screens.getMainAppointmentsScreen().getOnlineConsultationTitle().tap()
        }
        return self
    }
    
    func goToClinicAdmission() -> AppointmentsHelper {
        step("Переход в раздел 'Прием в клинике'") {
            screens.getMainAppointmentsScreen().getClinicAdmissionTitle().tap()
        }
        return self
    }
    
    func goToCallingAtHome() {
        step("Переход в раздел 'Вызов на дом'") {
            screens.getMainAppointmentsScreen().getCallingAtHomeTitle().tap()
        }
    }
    
    func goToDiagnostic() -> AppointmentsHelper {
        step("Переход в раздел 'Диагностика'") {
            screens.getMainAppointmentsScreen().getDiagnosticTitle().tap()
        }
        return self
    }
    
    func goToAnalyzes() -> AppointmentsHelper {
        step("Переход в раздел 'Сдать анализы'") {
            XCTAssertTrue(screens.getMainAppointmentsScreen().getAnalyzesDesc().waitForHittable(timeout: ENV.timeout))
            screens.getMainAppointmentsScreen().getAnalyzesTitle().tap()
        }
        return self
    }
    
    func goToAllDoctors() {
        step("Переход в раздел 'Всех врачей'") {
            XCTAssertTrue(screens.getMainAppointmentsScreen().getClinicsAndDoctorsDoctorSegmentTitle().waitForHittable(timeout: ENV.timeout))
            screens.getMainAppointmentsScreen().getDashboardSeeAllDoctors().tap()
        }
    }
    
    func goToAllSpecializations() -> AppointmentsHelper {
        step("Переход в раздел 'Всех специализаций'") {
            XCTAssertTrue(screens.getMainAppointmentsScreen().getSpecializationTitle().waitForHittable(timeout: ENV.timeout))
            screens.getMainAppointmentsScreen().getSpecializationAllButton().tap()
        }
        return self
    }
    
    func goToAllClinics() {
        step("Переход в раздел 'Всех клиник'") {
            XCTAssertTrue(screens.getMainAppointmentsScreen().getClinicsTitle().waitForHittable(timeout: ENV.timeout))
            screens.getMainAppointmentsScreen().getClinicsAllButton().tap()
        }
    }
    
    func confirmCity() -> AppointmentsHelper {
        step("Подтверждение города") {
            if screens.getMainAppointmentsScreen().getConfirmCityButton().waitForHittable(timeout: ENV.timeout) {
                screens.getMainAppointmentsScreen().getConfirmCityButton().tap()
            }
        }
        return self
    }
    
    func chooseSpecialization(index: Int) -> AppointmentsHelper {
        step("Выбор специализации из списка под номером: '\(index)'") {
            XCTAssertTrue(screens.getOnlineConsultationFirstScreen().getPageSubtitle().waitForHittable(timeout: ENV.flakyTimeout))
            
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < 15) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getOnlineConsultationFirstScreen().getSpecializationSubtitle(index: index).waitForHittable(timeout: ENV.timeout))
            screens.getOnlineConsultationFirstScreen().getSpecializationTitle(index: index).tap()
        }
        return self
    }
    
    func chooseClinicSpecialization(index: Int) {
        step("Выбор специализации из списка под номером: '\(index)'") {
            XCTAssertTrue(screens.getOnlineConsultationFirstScreen().getPageSubtitle().waitForHittable(timeout: ENV.flakyTimeout))
            
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getOnlineConsultationFirstScreen().getClinicSpecializationTitle(index: index).waitForHittable(timeout: ENV.timeout))
            screens.getOnlineConsultationFirstScreen().getClinicSpecializationTitle(index: index).tap()
        }
    }
    
    func confirmAttentionScreen() -> AppointmentsHelper {
        step("Подтверждение экрана предупреждения") {
            XCTAssertTrue(screens.getAppointmentAttentionScreen().getPageImage().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentAttentionScreen().getPageTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentAttentionScreen().getPageSubtitle().isHittable)
            XCTAssertTrue(screens.getAppointmentAttentionScreen().getInterruptButton().isHittable)
            
            screens.getAppointmentAttentionScreen().getContinueButton().tap()
        }
        return self
    }
    
    func checkAppointmentSuccessScreen(testData: OnlineConsultationTestData) {
        step("Проверка экрана успешной записи") {
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPatientTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertEqual(testData.patient, screens.getAppointmentSuccessScreen().getPatientValue().label)
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getServiceTitle().isHittable)
            XCTAssertEqual(testData.service, screens.getAppointmentSuccessScreen().getServiceValue().label)
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getDoctorTitle().isHittable)
            XCTAssertEqual(testData.doctor, screens.getAppointmentSuccessScreen().getDoctorValue().label)
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getSpecializationTitle().isHittable)
            XCTAssertEqual(testData.specialization, screens.getAppointmentSuccessScreen().getSpecializationValue().label)
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getTotalTitle().isHittable)
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getSuccessImage().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getSuccessTitle().isHittable)
            
            screens.getAppointmentSuccessScreen().getChatButton().tap()
        }
    }
    
    func approveDiagnosticRecord() {
        step("Подтверждение записи на диагностику") {
            screens.getAppointmentConfirmationClinicScreen().getApproveRecordDiagnosticsButtonText().tap()
        }
    }
    
    func chooseService(index: Int) {
        step("Выбора услуги") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentServiceScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentServiceScreen().getFilterButton().isHittable)
            XCTAssertTrue(screens.getAppointmentServiceScreen().getSearchButton().isHittable)
            sleep(3)
            XCTAssertTrue(screens.getAppointmentServiceScreen().getServiceName(index: index).waitForHittable(timeout: ENV.timeout))
            
            screens.getAppointmentServiceScreen().getServicButton(index: index).forceTap()
            XCTAssertTrue(screens.getAppointmentServiceScreen().getTotalPrice().isHittable)
            XCTAssertTrue(screens.getAppointmentServiceScreen().getTotalServices().isHittable)
            
            screens.getAppointmentServiceScreen().getContinueButton().forceTap()
        }
    }
    
    func checkConfirmationHomeCall() -> AppointmentsHelper {
        step("Провекра экрана подтверждения заявки вызова на дом") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getApproveHomeCallNavigationTitle().waitForHittable(timeout: ENV.timeout))
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallPatient().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallPatientValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallContactPhone().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallContactPhoneValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallAppointmentDate().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallAppointmentDateValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallAddress().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallAddressValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallComplaints().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallComplaintsValue().isHittable)
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallChoosenServices().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallChoosenServiceTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallChoosenServiceAmount().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallChoosenServiceIndex().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallPaymentMethod().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationHomeScreen().getHomeCallByCardOrInCashToDoctor().isHittable)
            
            screens.getAppointmentConfirmationHomeScreen().getHomeCallMakeAppointment().tap()
        }
        return self
    }
    
    func checkSuccessHomeCall() {
        step("Провекра экрана успеха заявки вызова на дом") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPaymentStateStatusTitle().waitForHittable(timeout: ENV.flakyTimeout))
            
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPaymentStateSuccessTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPaymentStateSuccessImage().isHittable)
            XCTAssertTrue(screens.getAppointmentSuccessScreen().getPaymentStateSuccessDescription().isHittable)
            
            screens.getAppointmentSuccessScreen().getSkiniveBackToDashboard().tap()
        }
    }
    
    func selectDiagnostic(index: Int) -> AppointmentsHelper {
        step("Выбор диагностики") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            screens.getAppointmentServiceScreen().getServiceName(index: index).tap()
        }
        return self
    }
    
    func checkConfirmationScreen() -> AppointmentsHelper {
        step("Провекра экрана подтверждения заявки") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPageSubtitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPageTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPatientTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPatientTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPatientValue().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getServiceTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getServiceValue().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getSpecializationTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getSpecializationValue().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getDoctorTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getDoctorValue().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getPaymentMethodTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getTotalTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getTotalValue().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getOfferTitle().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getOfferCheckbox().isHittable)
            XCTAssertTrue(screens.getAppointmentConfirmationScreen().getOfferButton().isHittable)
        }
        return self
    }
    
    func tapOnPayButton() {
        step("Нажатие на кнопку 'Оплатить'") {
            screens.getAppointmentConfirmationScreen().getPayButton().tap()
        }
    }
}
