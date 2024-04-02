//
//  UIRegistrationTests.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 22.01.2024.
//

final class UIRegistrationTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Registration")
    }
    
    func testRegistrationUser() {
        let user: User = Users.shared.createUser(type: .new)
        
        h.getAuthorizationHelper()
            .enterPhone(phone: user.phoneNumber)
        
        h.getRegistrationHelper()
            .enterPassword(password: user.password)
            .enterRegistrationSms(phoneNumber: user.phoneNumber)
            .checkAndSelectNewClient()
            .registerNewClient(user: user)
        
        h.getAuthorizationHelper()
            .enterPinCode(code: [1,2,4,3])
            .enterPinCode(code: [1,2,4,3])
        
        h.getCommonHelper()
            .checkMainScreenButton()
    }
}
