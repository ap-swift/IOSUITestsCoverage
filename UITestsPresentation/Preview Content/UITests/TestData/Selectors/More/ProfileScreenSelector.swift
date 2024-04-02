//
//  ProfileScreenSelector.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

struct ProfileScreenSelector {
    static let pageTitle: String = L10n.profileEditNavigationTitle
    static let pageDesc: String = "Почти готово! Обработка ваших данных займёт некоторое время. Мы свяжемся с вами при необходимости."
    static let backButton: String = "Назад"
    static let doneButton: String = L10n.doneButtonText
    
    static let nameTitle: String = L10n.profileUserLastName
    static let surnameTitle: String = L10n.profileUserFirstName
    static let lastNameTitle: String = L10n.profileUserMiddleName
    static let lastNameCheckbox: String = "ic checkbox square"
    static let lastNameCheckboxTitle: String = L10n.profileUserMiddleNameCheckBoxTitle
    static let genderTitle: String = L10n.profileUserGender
    static let genderSelectButton: String = L10n.doneBarButtonItem
    static let dateTitle: String = L10n.profileUserBirthday
    
    // passport
    static let passportNumberTitle: String = L10n.seriesAndNumber
    static let passportAddressTitle: String = L10n.issuedBy
    static let passportDateTitle: String = L10n.issueDate
    static let passportCodeTitle: String = L10n.divisionCode
    static let addressTitle: String = L10n.profileRegistrationAddressTitle
    static let phoneTitle: String = L10n.profileUserPhone
    static let emailTitle: String = L10n.profileUserMail
    static let exitButton: String = L10n.profileExitButtonTitle
}
