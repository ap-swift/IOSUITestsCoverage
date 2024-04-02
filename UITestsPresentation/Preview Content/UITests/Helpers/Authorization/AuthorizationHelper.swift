//
//  AuthorizationHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class AuthorizationHelper: XCTest {
    private let screens: ScreensManager
    private let apiAuthorization = ApiAuthorization()
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func authByPhone(user: User) {
        step("Авторизация по номеру телефона: '\(user.phoneNumber)'") {
            if screens.getPinCodeScreen().getForgetCodeButton().waitForHittable(timeout: ENV.timeout) {
                screens.getPinCodeScreen().getForgetCodeButton().tap()
            } 
            XCTAssertTrue(screens.getAuthorizationScreen().getLogo().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAuthorizationScreen().getPhoneNumberTitle().isHittable)
            screens.getAuthorizationScreen().getPhoneNumberField().tap()
            screens.getAuthorizationScreen().getPhoneNumberField().typeText(user.phoneNumber)
            screens.getAuthorizationScreen().getContinueButton().tap()
            _ = enterPassword(password: user.password)
            if screens.getSmsCodeScreen().getSmsCodeTitle().waitForHittable(timeout: ENV.timeout) {
                let sms = apiAuthorization.fetchSms(forPhone: user.phoneNumber)
                screens.getSmsCodeScreen().getSmsCodeField().tap()
                screens.getSmsCodeScreen().getSmsCodeField().typeText(sms)
            }
            _ = enterPinCode(code: [1,2,4,3])
            _ = enterPinCode(code: [1,2,4,3])
        }
    }
    
    func enterPhone(phone: String) -> AuthorizationHelper {
        step("Ввод номера телефона: '\(phone)'") {
            if screens.getPinCodeScreen().getForgetCodeButton().waitForHittable(timeout: ENV.timeout) {
                screens.getPinCodeScreen().getForgetCodeButton().tap()
            } 
            screens.getAuthorizationScreen().getPhoneNumberField().tap()
            screens.getAuthorizationScreen().getPhoneNumberField().typeText(phone)
            screens.getAuthorizationScreen().getContinueButton().tap()
        }
        return self
    }
    
    func enterPinCode(code: [Int]) -> AuthorizationHelper {
        step("Ввод пин-кода") {
            XCTAssertTrue(screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: code[0]).waitForHittable(timeout: ENV.flakyTimeout))
            screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: code[0]).tap()
            screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: code[1]).tap()
            screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: code[2]).tap()
            screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: code[3]).tap()
        }
        return self
    }
    
    func enterPassword(password: String) -> AuthorizationHelper {
        step("Ввод пароля") {
            screens.getPasswordScreen().getPasswordField().tap()
            screens.getPasswordScreen().getPasswordField().typeText(password)
            screens.getPasswordScreen().getEnterButton().tap()
        }
        return self
    }
    
    func checkAuthScreen() {
        step("Проверка экрана ввода номера телефона") {
            if screens.getPinCodeScreen().getForgetCodeButton().waitForHittable(timeout: ENV.timeout) {
                screens.getPinCodeScreen().getForgetCodeButton().tap()
            }
            XCTAssertTrue(screens.getAuthorizationScreen().getLogo().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getAuthorizationScreen().getPhoneNumberTitle().isHittable)
            XCTAssertTrue(screens.getAuthorizationScreen().getFormatNumbersTitle().isHittable)
            XCTAssertFalse(screens.getAuthorizationScreen().getContinueButton().isEnabled)
            
            screens.getAuthorizationScreen().getPhoneNumberTitle().tap()
            XCTAssertTrue(screens.getAuthorizationScreen().getPhoneNumberError().isHittable)
            
            screens.getAuthorizationScreen().getFormatNumbersButton().tap()
            XCTAssertTrue(screens.getAuthorizationScreen().getAvailablePhonesDescription().isHittable)
            
            for index in 1...11 {
                XCTAssertTrue(screens.getAuthorizationScreen().getAvailableNumberFlag(index: index).isHittable)
                XCTAssertTrue(screens.getAuthorizationScreen().getAvailableNumberValue(index: index).isHittable)
            }
            
            screens.getAuthorizationScreen().getAvailablePhonesCloseButton().tap()
            XCTAssertFalse(screens.getAuthorizationScreen().getAvailablePhonesCloseButton().isHittable)
        }
    }
    
    func checkPasswordError() {
        step("Проверка ошибки ввода пароля") {
            XCTAssertTrue(screens.getPasswordScreen().getErrorTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getPasswordScreen().getErrorDesc().isHittable)
        }
    }
    
    func enterSms(phoneNumber: String) -> AuthorizationHelper {
        step("Ввод смс") {
            if screens.getSmsCodeScreen().getSmsCodeField().waitForHittable(timeout: ENV.timeout) {
                let sms = apiAuthorization.fetchSms(forPhone: phoneNumber)
                screens.getSmsCodeScreen().getSmsCodeField().typeText(sms)
            }
        }
        return self
    }
    
    func checkPinCodeError() {
        step("Проверка ошибки ввода пин-кода") {
            XCTAssertTrue(screens.getPinCodeScreen().getPinCodeDigitButtonVia(digit: 1).isHittable)
            XCTAssertFalse(screens.getCommonScreen().getMainScreenNavigationIcon().isHittable)
        }
    }
}
