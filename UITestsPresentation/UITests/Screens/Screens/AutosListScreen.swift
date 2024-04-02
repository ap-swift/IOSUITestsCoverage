//
//  AutosListScreen.swift
//  UITestsPresentation
//
//  Created by Artem Parfenov on 02.04.2024.
//

import XCTest

private typealias ENV = UITestEnvConfig
private typealias S = CarsListSelectors

final class AutosListScreen {
    private let app = XCUIApplication()

    private var listTitle: XCUIElement?

    private var bmw: XCUIElement?
    private var hyundaiSonata: XCUIElement?

    func getListTitle() -> XCUIElement {
        self.listTitle = app.staticTexts[S.listTitle]
        return self.listTitle!
    }

    func getBmw() -> XCUIElement {
        self.bmw = app.staticTexts[S.bmw]
        return self.bmw!
    }

    func getHyundaiSonata() -> XCUIElement {
        self.hyundaiSonata = app.staticTexts[S.hyundaiSonata]
        return self.hyundaiSonata!
    }
}
