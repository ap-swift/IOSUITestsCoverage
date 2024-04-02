//
//  UIAuthorizationTests.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

final class UIAuthorizationTest: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Smoke")
    }
    
    func testAuthorization() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
    }
}
