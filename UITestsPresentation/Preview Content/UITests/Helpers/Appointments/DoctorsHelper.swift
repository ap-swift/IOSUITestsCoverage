//
//  DoctorsHelper.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class DoctorsHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func searchDoctor(value: String) -> DoctorsHelper {
        step("Поиск доктора в списке") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getDoctorsScreen().getDashboardDoctors().waitForHittable(timeout: ENV.flakyTimeout))
            
            XCTAssertTrue(screens.getDoctorsScreen().getDoctorName(index: 0).isHittable)
            XCTAssertTrue(screens.getDoctorsScreen().getDoctorClinic(index: 0).isHittable)
            XCTAssertTrue(screens.getDoctorsScreen().getDoctorSpecialization(index: 0).isHittable)
            
            screens.getDoctorsScreen().getFullNameDoctor().tap()
            screens.getDoctorsScreen().getFullNameDoctor().typeText(value)
            
            var secondCount = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                secondCount += 1
                sleep(1)
            }
            
            screens.getDoctorsScreen().getSearchElement().tap()
        }
        return self
    }
    
    func goToDoctorClinic() {
        step("Переход в клиники доктора") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getDoctorScreen().getDoctorTitle().waitForHittable(timeout: ENV.timeout))
            screens.getDoctorScreen().getClinicButton().tap()
        }
    }
    
    func checkDoctorScreen(testData: DoctorTestData) {
        step("Проверка детальной информации по доктору") {
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertTrue(screens.getDoctorScreen().getDoctorTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getDoctorScreen().getShareButton().isHittable)
            
            XCTAssertEqual(testData.doctorName, screens.getDoctorScreen().getDoctorName().label)
            XCTAssertEqual(testData.doctorDesc, screens.getDoctorScreen().getDoctorDesc().label)
            XCTAssertEqual(testData.doctorSpecialization, screens.getDoctorScreen().getDoctorSpecialization().label)
            
            XCTAssertTrue(screens.getDoctorScreen().getClinicButton().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertEqual(testData.clinicName, screens.getDoctorScreen().getClinicTitle().label)
            XCTAssertEqual(testData.clinicAddress, screens.getDoctorScreen().getClinicAddress().label)
            
            _ = screens.getCommonScreen().swipeUp()
            XCTAssertTrue(screens.getDoctorScreen().getSpecialityTitle().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            _ = screens.getCommonScreen().swipeUp()
            
            for index in 3...9 {
                XCTAssertTrue(screens.getDoctorScreen().getSpecialityElement(index: index).isHittable)
            }
            
            _ = screens.getCommonScreen().swipeUp()
            XCTAssertTrue(screens.getDoctorScreen().getEducationTitle().isHittable)
            _ = screens.getCommonScreen().swipeUp()
            XCTAssertTrue(screens.getDoctorScreen().getEducationDiplomTitle().isHittable)
            XCTAssertTrue(screens.getDoctorScreen().getEducationDiplomDesc().isHittable)
        }
    }
}
