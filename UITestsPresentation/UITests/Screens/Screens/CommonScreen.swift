//
//  CommonScreen.swift
//  UITestsPresentation
//
//  Created by Artem Parfenov on 02.04.2024.
//

import XCTest

private typealias S = CommonSelectors

final class CommonScreen {
    private let app = XCUIApplication()

    private var backButton: XCUIElement?

    func getBackButton() -> XCUIElement {
        self.backButton = app.buttons[S.backButton]
        return self.backButton!
    }

}
