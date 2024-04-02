//
//  Screens.swift
//  ProjectUITests
//
//  Created by Artem Parfenov on 02.04.2024.
//

import XCTest

private typealias ENV = UITestEnvConfig
private typealias S = WelcomeScreenSelectors


final class WelcomeScreen {
    private let app: XCUIApplication = XCUIApplication()

    private var welcomeTitle: XCUIElement?

    private var carImage: XCUIElement?
    private var chooseCarTitle: XCUIElement?

    func getWelcomeTitle() -> XCUIElement {
        self.welcomeTitle = app.staticTexts[S.welcomeTitle]
        return welcomeTitle!
    }

    func getCarImage() -> XCUIElement {
        self.carImage = app.staticTexts[S.carImage]
        return carImage!
    }

    func getChooseCarTitle() -> XCUIElement {
        self.chooseCarTitle = app.staticTexts[S.chooseCarTitle]
        return chooseCarTitle!
    }
}
