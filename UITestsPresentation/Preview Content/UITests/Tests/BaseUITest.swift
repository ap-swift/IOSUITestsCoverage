//
//  BaseUITest.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

class BaseUITest: XCTestCase {
    let h: HelpersManager = HelpersManager()
    
    override func setUp() {
        step("Подготовка окружения и запуск приложения") {
            self.beforeTest()
        }
    }
    
    override func tearDown() {
        step("Завершение теста и закрытие приложения") {
            h.getCommonHelper()
                .closeApplication()
        }
    }
    
    func beforeTest(softAssert: Bool = ENV.defaultContinueAfterFailure) {
        continueAfterFailure = softAssert
        h.getCommonHelper()
            .addLocalisationLaunchArgs()
            .launchApplication()
            .allowGeolocation()
            .skipOnboarding()
    }
}
