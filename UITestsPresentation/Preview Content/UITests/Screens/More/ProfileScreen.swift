//
//  ProfileScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

import XCTest
private typealias S = ProfileScreenSelector
private typealias ENV = UITestEnvConfig

final class ProfileScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var pageDesc: XCUIElement?
    private var backButton: XCUIElement?
    private var doneButton: XCUIElement?
    
    // fields
    private var nameTitle: XCUIElement?
    private var nameField: XCUIElement?
    
    private var surnameTitle: XCUIElement?
    private var surnameField: XCUIElement?
    
    private var lastNameTitle: XCUIElement?
    private var lastNameField: XCUIElement?
    
    private var lastNameCheckbox: XCUIElement?
    private var lastNameCheckboxTitle: XCUIElement?
    
    private var genderTitle: XCUIElement?
    private var genderField: XCUIElement?
    private var genderValue: XCUIElement?
    private var genderSelectButton: XCUIElement?
    
    private var dateTitle: XCUIElement?
    private var dateField: XCUIElement?
    
    // passport
    private var passportNumberTitle: XCUIElement?
    private var passportNumberField: XCUIElement?
    
    private var passportAddressTitle: XCUIElement?
    private var passportAddressField: XCUIElement?
    
    private var passportDateTitle: XCUIElement?
    private var passportDateField: XCUIElement?
    
    private var passportCodeTitle: XCUIElement?
    private var passportCodeField: XCUIElement?
    
    private var addressTitle: XCUIElement?
    private var addressField: XCUIElement?
    
    private var phoneTitle: XCUIElement?
    private var phoneDesc: XCUIElement?
    
    private var emailTitle: XCUIElement?
    private var emailField: XCUIElement?
    
    private var exitButton: XCUIElement?
    
    private func getTemplateField(type: String) -> XCUIElement {
        return app.cells.containing(.staticText, identifier:type).children(matching: .textField).element
    }
    
    // header
    func getBackButton() -> XCUIElement {
        self.backButton = app.buttons[S.backButton]
        return backButton!
    }
    
    func getDoneButton() -> XCUIElement {
        self.doneButton = app.buttons[S.doneButton]
        return doneButton!
    }
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.staticTexts[S.pageTitle]
        return pageTitle!
    }
    
    func getPageDesc() -> XCUIElement {
        self.pageDesc = app.staticTexts[S.pageDesc]
        return pageDesc!
    }
    
    // fields
    func getNameTitle() -> XCUIElement {
        self.nameTitle = app.staticTexts[S.nameTitle]
        return nameTitle!
    }
    
    func getNameField() -> XCUIElement {
        self.nameField = getTemplateField(type: S.nameTitle)
        XCTAssertTrue(nameField!.waitForHittable(timeout: ENV.timeout))
        return nameField!
    }
    
    func getSurnameTitle() -> XCUIElement {
        self.surnameTitle = app.staticTexts[S.surnameTitle]
        return surnameTitle!
    }
    
    func getSurnameField() -> XCUIElement {
        self.surnameField = getTemplateField(type: S.surnameTitle)
        XCTAssertTrue(surnameField!.waitForHittable(timeout: ENV.timeout))
        return surnameField!
    }
    
    func getLastNameTitle() -> XCUIElement {
        self.lastNameTitle = app.staticTexts[S.lastNameTitle]
        return lastNameTitle!
    }
    
    func getLastNameField() -> XCUIElement {
        self.lastNameField = getTemplateField(type: S.lastNameTitle)
        XCTAssertTrue(lastNameField!.waitForHittable(timeout: ENV.timeout))
        return lastNameField!
    }
    
    func getLastNameCheckbox() -> XCUIElement {
        self.lastNameCheckbox = app.staticTexts[S.lastNameCheckbox]
        return lastNameCheckbox!
    }
    
    func getLastNameCheckboxTitle() -> XCUIElement {
        self.lastNameCheckboxTitle = app.staticTexts[S.lastNameCheckboxTitle]
        XCTAssertTrue(lastNameCheckboxTitle!.waitForHittable(timeout: ENV.timeout))
        return lastNameCheckboxTitle!
    }
    
    func getGenderTitle() -> XCUIElement {
        self.genderTitle = app.staticTexts[S.genderTitle]
        return genderTitle!
    }
    
    func getGenderField() -> XCUIElement {
        self.genderField = getTemplateField(type: S.genderTitle)
        XCTAssertTrue(genderField!.waitForHittable(timeout: ENV.timeout))
        return genderField!
    }
    
    func getGenderSelectButton() -> XCUIElement {
        self.genderSelectButton = app.buttons[S.genderSelectButton]
        return genderSelectButton!
    }
    
    func getDateTitle() -> XCUIElement {
        self.dateTitle = app.staticTexts[S.dateTitle]
        return dateTitle!
    }
    
    func getDateField() -> XCUIElement {
        self.dateField = getTemplateField(type: S.dateTitle)
        XCTAssertTrue(dateField!.waitForHittable(timeout: ENV.timeout))
        return dateField!
    }
    
    //passport
    func getPassportNumberTitle() -> XCUIElement {
        self.passportNumberTitle = app.staticTexts[S.passportNumberTitle]
        return passportNumberTitle!
    }
    
    func getPassportNumberField() -> XCUIElement {
        self.passportNumberField = getTemplateField(type: S.passportNumberTitle)
        return passportNumberField!
    }
    
    func getPassportAddressTitle() -> XCUIElement {
        self.passportAddressTitle = app.staticTexts[S.passportAddressTitle]
        return passportAddressTitle!
    }
    
    func getPassportAddressField() -> XCUIElement {
        self.passportAddressField = getTemplateField(type: S.passportAddressTitle)
        return passportAddressField!
    }
    
    func getPassportDateTitle() -> XCUIElement {
        self.passportDateTitle = app.staticTexts[S.passportDateTitle]
        return passportDateTitle!
    }
    
    func getPassportDateField() -> XCUIElement {
        self.passportDateField = getTemplateField(type: S.passportDateTitle)
        return passportDateField!
    }
    
    func getPassportCodeTitle() -> XCUIElement {
        self.passportCodeTitle = app.staticTexts[S.passportCodeTitle]
        return passportCodeTitle!
    }
    
    func getPassportCodeField() -> XCUIElement {
        self.passportCodeField = getTemplateField(type: S.passportCodeTitle)
        return passportCodeField!
    }
    
    func getAddressTitle() -> XCUIElement {
        self.addressTitle = app.staticTexts[S.addressTitle]
        return addressTitle!
    }
    
    func getAddressField() -> XCUIElement {
        self.addressField = getTemplateField(type: S.addressTitle)
        return addressField!
    }
    
    func getPhoneTitle() -> XCUIElement {
        self.phoneTitle = app.staticTexts[S.phoneTitle]
        return phoneTitle!
    }
    
    func getPhoneField() -> XCUIElement {
        self.phoneDesc = getTemplateField(type: S.phoneTitle)
        return phoneDesc!
    }
    
    func getEmailTitle() -> XCUIElement {
        self.emailTitle = app.staticTexts[S.emailTitle]
        return emailTitle!
    }
    
    func getEmailField() -> XCUIElement {
        self.emailField = getTemplateField(type: S.emailTitle)
        return emailField!
    }
    
    func getExitButton() -> XCUIElement {
        self.exitButton = app.staticTexts[S.exitButton]
        return exitButton!
    }
}
