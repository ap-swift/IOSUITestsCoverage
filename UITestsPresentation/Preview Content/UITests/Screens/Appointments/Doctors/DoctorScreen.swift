//
//  DoctorScreen.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

import XCTest

private typealias S = DoctorsScreenSelector
private typealias ENV = UITestEnvConfig

final class DoctorScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var doctorTitle: XCUIElement?
    private var shareButton: XCUIElement?
    
    private var doctorName: XCUIElement?
    private var doctorDesc: XCUIElement?
    private var doctorSpecialization: XCUIElement?
    
    private var clinicButton: XCUIElement?
    private var clinicTitle: XCUIElement?
    private var clinicAddress: XCUIElement?
    
    private var specialityTitle: XCUIElement?
    private var specialityElement: XCUIElement?
    
    private var educationTitle: XCUIElement?
    
    private var educationDiplomTitle: XCUIElement?
    private var educationDiplomDesc: XCUIElement?
    
    func getDoctorTitle() -> XCUIElement {
        self.doctorTitle = app.staticTexts[S.doctorTitle]
        return doctorTitle!
    }
    
    func getShareButton() -> XCUIElement {
        self.shareButton = app.buttons[S.shareButton]
        return shareButton!
    }
    
    func getDoctorName() -> XCUIElement {
        self.doctorName = app.cells.firstMatch.staticTexts.firstMatch
        return doctorName!
    }
    
    func getDoctorDesc() -> XCUIElement {
        self.doctorDesc = app.cells.firstMatch.staticTexts.allElementsBoundByIndex[1]
        return doctorDesc!
    }
    
    func getDoctorSpecialization() -> XCUIElement {
        self.doctorSpecialization = app.cells.firstMatch.staticTexts.allElementsBoundByIndex[2]
        return doctorSpecialization!
    }
    
    func getClinicButton() -> XCUIElement {
        self.clinicButton = app.staticTexts[S.clinicButton]
        return clinicButton!
    }
    
    func getClinicTitle() -> XCUIElement {
        self.clinicTitle = app.cells.allElementsBoundByIndex[2].staticTexts.allElementsBoundByIndex[1]
        return clinicTitle!
    }
    
    func getClinicAddress() -> XCUIElement {
        self.clinicAddress = app.cells.allElementsBoundByIndex[2].staticTexts.firstMatch
        return clinicAddress!
    }
    
    func getSpecialityTitle() -> XCUIElement {
        self.specialityTitle = app.staticTexts[S.specialityTitle]
        return specialityTitle!
    }
    
    func getSpecialityElement(index: Int) -> XCUIElement {
        self.specialityElement = app.cells.allElementsBoundByIndex[index].staticTexts.element
        return specialityElement!
    }
    
    func getEducationTitle() -> XCUIElement {
        self.educationTitle = app.staticTexts[S.educationTitle]
        return educationTitle!
    }
    
    func getEducationDiplomTitle() -> XCUIElement {
        self.educationDiplomTitle = app.staticTexts[S.educationDiplomTitle]
        return educationDiplomTitle!
    }
    
    func getEducationDiplomDesc() -> XCUIElement {
        self.educationDiplomDesc = app.cells.allElementsBoundByIndex.last?.staticTexts.element
        return educationDiplomDesc!
    }
}
