//
//  Screen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest

private typealias S = Selector
private typealias ENV = UITestEnvConfig

final class Screen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var element: XCUIElement?
    
    func getElement() -> XCUIElement {
        self.element = app.textFields[S.elementSelector]
        XCTAssertTrue(element!.waitForHittable(timeout: ENV.timeout))
        return element!
    }
}
