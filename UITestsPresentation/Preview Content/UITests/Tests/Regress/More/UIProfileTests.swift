//
//  UIProfileTests.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

final class UIProfileTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Profile")
    }
    
    func testProfileDetails() {
        let passportTestData = PassportTestData(
            passportNumber: PassportTestData.passportNumberValue,
            passportAddress: PassportTestData.passportAddressValue,
            passportDate: PassportTestData.passportDateValue,
            passportCode: PassportTestData.passportCodeValue,
            address: PassportTestData.addressValue,
            phone: PassportTestData.phoneValue
        )
        
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .goToProfile()
        
        h.getCommonHelper()
            .waitLoading()
        
        h.getProfileScreenHelper()
            .checkProfileElemets(
                user: Users.shared.createUser(type: .main),
                testData: passportTestData
            )
    }
}
