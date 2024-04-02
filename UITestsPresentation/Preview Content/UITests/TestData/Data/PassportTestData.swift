//
//  PassportTestData.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

public struct PassportTestData {
    static let passportNumberValue: String = "8844 568446"
    static let passportAddressValue: String = "Отделом УФМС Росии по гор. Москва по району Люблино "
    static let passportDateValue: String = "01. 01. 2001 г."
    static let passportCodeValue: String = "770-555"
    static let addressValue: String = "Москва, люблино, краснодраская 14а "
    static let phoneValue: String = "+7 (977) 887-43-92"
    
    var passportNumber: String
    var passportAddress: String
    var passportDate: String
    var passportCode: String
    var address: String
    var phone: String
    
    init(
        passportNumber: String = "",
        passportAddress: String = "",
        passportDate: String = "",
        passportCode: String = "",
        address: String = "",
        phone: String = ""
    ) {
        self.passportNumber = passportNumber
        self.passportAddress = passportAddress
        self.passportDate = passportDate
        self.passportCode = passportCode
        self.address = address
        self.phone = phone
    }
}
