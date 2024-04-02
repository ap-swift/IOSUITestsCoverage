//
//  CarScreen.swift
//  UITestsPresentation
//
//  Created by Artem Parfenov on 02.04.2024.
//

import XCTest

private typealias S = CarSelectors

final class CarScreen {
    private let app = XCUIApplication()

    private var carTitle: XCUIElement?

    func getCarTitle() -> XCUIElement {
        self.carTitle = app.staticTexts[S.carTitle]
        return self.carTitle!
    }

}
