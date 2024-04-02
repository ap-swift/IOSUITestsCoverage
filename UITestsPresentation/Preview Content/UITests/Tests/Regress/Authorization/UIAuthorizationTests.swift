//
//  AuthorizationTests.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 17.01.2024.
//

final class UIAuthorizationTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Authorization")
    }
    
    func testAuthWithValidData() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
    }
    
    func testAuthScreen() {        
        h.getAuthorizationHelper()
            .checkAuthScreen()
    }
    
    func testPasswordScreen() {
        let phoneNumber = Users.shared.createUser(type: .main).phoneNumber
        let incorrectPassword = Users.shared.createUser(type: .broken).password
        
        h.getAuthorizationHelper()
            .enterPhone(phone: phoneNumber)
            .enterPassword(password: incorrectPassword)
            .checkPasswordError()
    }
    
    func testPinCodeScreen() {
        let user: User = Users.shared.createUser(type: .main)
        
        h.getAuthorizationHelper()
            .enterPhone(phone: user.phoneNumber)
            .enterPassword(password: user.password)
            .enterSms(phoneNumber: user.phoneNumber)
            .enterPinCode(code: [1,2,4,3])
            .enterPinCode(code: [1,2,4,4])
            .checkPinCodeError()
    }
}
