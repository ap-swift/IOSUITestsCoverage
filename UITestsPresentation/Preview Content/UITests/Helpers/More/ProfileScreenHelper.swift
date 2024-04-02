//
//  ProfileScreenHelper.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias TD = AppThemeTestData
private typealias N_TD = NotificationTestData

final class ProfileScreenHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func checkProfileElemets(user: User, testData: PassportTestData) {
        step("Проверка данных профиля") {
            XCTAssertTrue(screens.getProfileScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getProfileScreen().getPageDesc().isHittable)
            
            XCTAssertTrue(screens.getProfileScreen().getNameTitle().isHittable)
            XCTAssertEqual(user.surname, screens.getProfileScreen().getNameField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getSurnameTitle().isHittable)
            XCTAssertEqual(user.name, screens.getProfileScreen().getSurnameField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getLastNameTitle().isHittable)
            XCTAssertEqual(user.lastname, screens.getProfileScreen().getLastNameField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getLastNameCheckboxTitle().isHittable)
            
            XCTAssertTrue(screens.getProfileScreen().getGenderTitle().isHittable)
            XCTAssertTrue(screens.getProfileScreen().getGenderField().isHittable)
            
            XCTAssertTrue(screens.getProfileScreen().getDateTitle().isHittable)
            XCTAssertTrue(screens.getProfileScreen().getDateField().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getProfileScreen().getPassportNumberTitle().isHittable)
            XCTAssertEqual(testData.passportNumber, screens.getProfileScreen().getPassportNumberField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getPassportAddressTitle().isHittable)
            XCTAssertEqual(testData.passportAddress, screens.getProfileScreen().getPassportAddressField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getPassportDateTitle().isHittable)
            XCTAssertEqual(testData.passportDate, screens.getProfileScreen().getPassportDateField().value as? String)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getProfileScreen().getPassportCodeTitle().isHittable)
            XCTAssertEqual(testData.passportCode, screens.getProfileScreen().getPassportCodeField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getAddressTitle().isHittable)
            XCTAssertEqual(testData.address, screens.getProfileScreen().getAddressField().value as? String)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getProfileScreen().getPhoneTitle().isHittable)
            XCTAssertEqual(testData.phone, screens.getProfileScreen().getPhoneField().value as? String)
            
            XCTAssertTrue(screens.getProfileScreen().getEmailTitle().isHittable)
            XCTAssertTrue(screens.getProfileScreen().getEmailField().isHittable)
            XCTAssertTrue(screens.getProfileScreen().getExitButton().isHittable)
        }
    }
}
