//
//  Helper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias TD = TestData

final class Helper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func someMethod() -> Helper {
        step("Проверка заголовка элемента или описание действия: '\(TD.elementTitleValue)'") {
            
        }
        return self
    }
}
