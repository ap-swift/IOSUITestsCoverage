//
//  MainAppointmentsScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias S = MainAppointmentsScreenSelector
private typealias ENV = UITestEnvConfig

final class MainAppointmentsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var geopositionTitle: XCUIElement?
    private var profileTitle: XCUIElement?
    private var searchCell: XCUIElement?
    private var confirmCityButton: XCUIElement?
    
    private var onlineConsultationTitle: XCUIElement?
    private var onlineConsultationDesc: XCUIElement?
    private var clinicAdmissionTitle: XCUIElement?
    private var callingAtHomeTitle: XCUIElement?
    private var diagnosticTitle: XCUIElement?
    private var analyzesTitle: XCUIElement?
    private var analyzesDesc: XCUIElement?
    
    private var clinicsAndDoctorsDoctorSegmentTitle: XCUIElement?
    private var dashboardSeeAllDoctors: XCUIElement?
    
    private var specializationTitle: XCUIElement?
    private var specializationAllButton: XCUIElement?
    
    private var clinicsTitle: XCUIElement?
    private var clinicsAllButton: XCUIElement?
    
    func getGeopositionTitle() -> XCUIElement {
        self.geopositionTitle = app.buttons.staticTexts.allElementsBoundByIndex[0]
        XCTAssertTrue(geopositionTitle!.waitForHittable(timeout: ENV.timeout))
        return geopositionTitle!
    }
    
    func getProfileTitle() -> XCUIElement {
        self.profileTitle = app.buttons.staticTexts.allElementsBoundByIndex[1]
        XCTAssertTrue(profileTitle!.waitForHittable(timeout: ENV.timeout))
        return profileTitle!
    }
    
    func getSearchCell() -> XCUIElement {
        self.searchCell = app.cells.allElementsBoundByIndex[0].staticTexts.element
        XCTAssertTrue(searchCell!.waitForHittable(timeout: ENV.timeout))
        return searchCell!
    }
    
    func getOnlineConsultationTitle() -> XCUIElement {
        self.onlineConsultationTitle = app.staticTexts[S.onlineConsultationTitle]
        XCTAssertTrue(onlineConsultationTitle!.waitForHittable(timeout: ENV.timeout))
        return onlineConsultationTitle!
    }
    
    func getConfirmCityButton() -> XCUIElement {
        self.confirmCityButton = app.staticTexts[S.confirmCityButton]
        return confirmCityButton!
    }
    
    func getOnlineConsultationDesc() -> XCUIElement {
        self.onlineConsultationDesc = app.staticTexts[S.onlineConsultationDesc]
        return onlineConsultationDesc!
    }
    
    func getClinicAdmissionTitle() -> XCUIElement {
        self.clinicAdmissionTitle = app.staticTexts[S.clinicAdmissionTitle]
        XCTAssertTrue(clinicAdmissionTitle!.waitForHittable(timeout: ENV.timeout))
        return clinicAdmissionTitle!
    }
    
    func getCallingAtHomeTitle() -> XCUIElement {
        self.callingAtHomeTitle = app.staticTexts[S.callingAtHomeTitle]
        XCTAssertTrue(callingAtHomeTitle!.waitForHittable(timeout: ENV.timeout))
        return callingAtHomeTitle!
    }
    
    func getDiagnosticTitle() -> XCUIElement {
        self.diagnosticTitle = app.staticTexts[S.diagnosticTitle]
        XCTAssertTrue(diagnosticTitle!.waitForHittable(timeout: ENV.timeout))
        return diagnosticTitle!
    }
    
    func getAnalyzesTitle() -> XCUIElement {
        self.analyzesTitle = app.staticTexts[S.analyzesTitle]
        XCTAssertTrue(analyzesTitle!.waitForHittable(timeout: ENV.timeout))
        return analyzesTitle!
    }
    
    func getAnalyzesDesc() -> XCUIElement {
        self.analyzesDesc = app.staticTexts[S.analyzesDesc]
        return analyzesDesc!
    }
    
    func getClinicsAndDoctorsDoctorSegmentTitle() -> XCUIElement {
        self.clinicsAndDoctorsDoctorSegmentTitle = app.staticTexts[S.clinicsAndDoctorsDoctorSegmentTitle]
        return clinicsAndDoctorsDoctorSegmentTitle!
    }
    
    func getDashboardSeeAllDoctors() -> XCUIElement {
        self.dashboardSeeAllDoctors = app.staticTexts[S.dashboardSeeAllDoctors]
        return dashboardSeeAllDoctors!
    }
    
    func getSpecializationTitle() -> XCUIElement {
        self.specializationTitle = app.staticTexts[S.dashboardSpecialities]
        return specializationTitle!
    }
    
    func getSpecializationAllButton() -> XCUIElement {
        self.specializationAllButton = app.buttons[S.dashboardSeeAllSpecialities]
        return specializationAllButton!
    }
    
    func getClinicsTitle() -> XCUIElement {
        self.clinicsTitle = app.staticTexts[S.clinicsTitle]
        return clinicsTitle!
    }
    
    func getClinicsAllButton() -> XCUIElement {
        self.clinicsAllButton = app.buttons[S.clinicsAllButton]
        return clinicsAllButton!
    }
}
