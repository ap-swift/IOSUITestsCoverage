//
//  CommonScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias S = CommonScreenSelector

final class CommonScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var doneButton: XCUIElement?
    private var geolocationTitle: XCUIElement?
    private var continueButton: XCUIElement?
    private var allowButton: XCUIElement?
    private var notAllowButton: XCUIElement?
    private var skipButton: XCUIElement?
    private var loadingIndicator: XCUIElement?
    
    private var mainScreenNavigationIcon: XCUIElement?
    private var pharmacyNavigationIcon: XCUIElement?
    private var appointmentNavigationIcon: XCUIElement?
    private var medicalCardNavigationIcon: XCUIElement?
    private var moreNavigationIcon: XCUIElement?
    
    func getDoneButton() -> XCUIElement {
        self.doneButton = app.buttons[S.doneButton]
        XCTAssertTrue(doneButton!.waitForHittable(timeout: ENV.timeout))
        return doneButton!
    }
    
    func getGeolocationTitle() -> XCUIElement {
        self.geolocationTitle = app.staticTexts[S.geolocationTitle]
        return geolocationTitle!
    }
    
    func getContinueButton() -> XCUIElement {
        self.continueButton = app.buttons[S.continueButton]
        XCTAssertTrue(continueButton!.waitForHittable(timeout: ENV.timeout))
        return continueButton!
    }
    
    func getAllowButton() -> XCUIElement {
        self.allowButton = XCUIApplication(bundleIdentifier: S.simHomeScreenIdentifier).buttons[S.allowButton]
        return allowButton!
    }
    
    func getNotAllowButton() -> XCUIElement {
        self.notAllowButton = XCUIApplication(bundleIdentifier: S.simHomeScreenIdentifier).buttons[S.notAllowButton]
        return notAllowButton!
    }
    
    func getSkipButton() -> XCUIElement {
        self.skipButton = app.buttons[S.skipButton]
        return skipButton!
    }
    
    func getLoadingIndicator() -> XCUIElement {
        self.loadingIndicator = app.otherElements[S.loadingIndicator]
        return loadingIndicator!
    }
    
    func getMainScreenNavigationIcon() -> XCUIElement {
        self.mainScreenNavigationIcon = app.buttons[S.mainScreenNavigationIcon]
        return mainScreenNavigationIcon!
    }
    
    func getPharmacyNavigationIcon() -> XCUIElement {
        self.pharmacyNavigationIcon = app.buttons[S.pharmacyNavigationIcon]
        XCTAssertTrue(pharmacyNavigationIcon!.waitForHittable(timeout: ENV.timeout))
        return pharmacyNavigationIcon!
    }
    
    func getAppointmentNavigationIcon() -> XCUIElement {
        self.appointmentNavigationIcon = app.buttons[S.appointmentNavigationIcon]
        XCTAssertTrue(appointmentNavigationIcon!.waitForHittable(timeout: ENV.timeout))
        return appointmentNavigationIcon!
    }
    
    func getMedicalCardNavigationIcon() -> XCUIElement {
        self.medicalCardNavigationIcon = app.buttons[S.medicalCardNavigationIcon]
        XCTAssertTrue(medicalCardNavigationIcon!.waitForHittable(timeout: ENV.timeout))
        return medicalCardNavigationIcon!
    }
    
    func getMoreNavigationIcon() -> XCUIElement {
        self.moreNavigationIcon = app.buttons[S.moreNavigationIcon]
        XCTAssertTrue(moreNavigationIcon!.waitForHittable(timeout: ENV.timeout))
        return moreNavigationIcon!
    }
    
    func tapCoordinate(xCoordinate: Double, yCoordinate: Double) {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
    
    func selectDateInCalendar(day: String, month: String, year: String) {
        XCTAssertTrue(app.pickerWheels.element(boundBy: 0).waitForHittable(timeout: ENV.timeout))
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: year)
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: month)
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: day)
    }
    
    func swipeUp() -> CommonScreen {
        app.swipeUp()
        return self
    }
    
    func swipeDown() -> CommonScreen {
        app.swipeDown()
        return self
    }
}
