//
//  RegistrationHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 17.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class RegistrationHelper: XCTest {
    private let screens: ScreensManager
    private let apiAuthorization = ApiAuthorization()
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func checkAndSelectNewClient() -> RegistrationHelper {
        step("Выбор регистрации нового клиента") {
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getPageTitle().waitForHittable(timeout: ENV.flakyTimeout))
            
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getDmsClientTitle().isHittable)
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getDmsClientDesc().isHittable)
            
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getOldClientDesc().isHittable)
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getOldClientTitle().isHittable)
            
            XCTAssertTrue(screens.getRegistrationUserTypeScreen().getNewClientDesc().isHittable)
            screens.getRegistrationUserTypeScreen().getNewClientTitle().tap()
        }
        return self
    }
    
    func registerNewClient(user: User) {
        step("Регистрация нового клиента") {
            XCTAssertTrue(screens.getRegistrationScreen().getBackButton().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getRegistrationScreen().getPageTitle().isHittable)
            
            XCTAssertTrue(screens.getRegistrationScreen().getNameTitle().isHittable)
            screens.getRegistrationScreen().getNameField().tap()
            screens.getRegistrationScreen().getNameField().typeText(user.name)
            
            XCTAssertTrue(screens.getRegistrationScreen().getSurnameTitle().isHittable)
            screens.getRegistrationScreen().getSurnameField().tap()
            screens.getRegistrationScreen().getSurnameField().typeText(user.surname)
            
            XCTAssertTrue(screens.getRegistrationScreen().getLastNameTitle().isHittable)
            screens.getRegistrationScreen().getLastNameField().tap()
            screens.getRegistrationScreen().getLastNameField().typeText(user.lastname)
            
            XCTAssertTrue(screens.getRegistrationScreen().getLastNameCheckboxTitle().isHittable)
            
            XCTAssertTrue(screens.getRegistrationScreen().getGenderTitle().isHittable)
            screens.getRegistrationScreen().getGenderField().tap()
            screens.getRegistrationScreen().getGenderSelectButton().forceTap()
            
            XCTAssertTrue(screens.getRegistrationScreen().getDateTitle().isHittable)
            screens.getRegistrationScreen().getDateField().tap()
            screens.getCommonScreen().selectDateInCalendar(day: user.day, month: user.month, year: user.year)
            screens.getRegistrationScreen().getGenderSelectButton().tap()
            
            XCTAssertTrue(screens.getRegistrationScreen().getEmailTitle().isHittable)
            screens.getRegistrationScreen().getEmailField().tap()
            screens.getRegistrationScreen().getEmailField().typeText(user.email)
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getRegistrationScreen().getAddressTitle().isHittable)
            screens.getRegistrationScreen().getAddressField().tap()
            screens.getRegistrationScreen().getAddressField().typeText(user.address)
            
            screens.getRegistrationScreen().getDoneButton().tap()
            sleep(3)
            screens.getRegistrationScreen().getDoneButton().tap()
        }
    }
    
    func enterPassword(password: String) -> RegistrationHelper {
        step("Ввод пароля для регистрации") {
            screens.getPasswordScreen().getPasswordField().tap()
            screens.getPasswordScreen().getPasswordField().typeText(password)
            screens.getPasswordScreen().getRegistrationButton().tap()
        }
        return self
    }
    
    func enterRegistrationSms(phoneNumber: String) -> RegistrationHelper {
        step("Ввод смс") {
            XCTAssertTrue(screens.getSmsCodeScreen().getSmsCodeField().waitForHittable(timeout: ENV.flakyTimeout))
            let sms = apiAuthorization.fetchSms(forPhone: phoneNumber)
            screens.getSmsCodeScreen().getSmsCodeField().typeText(sms)
        }
        return self
    }
}
