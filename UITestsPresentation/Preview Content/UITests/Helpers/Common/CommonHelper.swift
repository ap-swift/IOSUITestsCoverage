//
//  CommonHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class CommonHelper: XCTest {
    private let h: HelpersManager
    private let screens: ScreensManager
    private let app = XCUIApplication()
    
    init(helpersManager: HelpersManager, screensManager: ScreensManager) {
        self.h = helpersManager
        self.screens = screensManager
    }
    
    func addLocalisationLaunchArgs() -> CommonHelper {
        step("Добавление аргументов для локализации") {
            app.launchArguments += ["-AppleLanguages", ENV.language_ru]
            app.launchArguments += ["-AppleLocale", ENV.locale_ru]
        }
        return self
    }
    
    func launchApplication() -> CommonHelper {
        step("Запуск приложения") {
            app.launch()
        }
        return self
    }
    
    func closeApplication() {
        step("Завершение приложения") {
            sleep(1)
            app.terminate()
        }
    }
    
    func swipeDown() {
        step("Cвайп вниз") {
            _ = screens.getCommonScreen().swipeDown()
        }
    }
    
    func swipeUp() {
        step("Cвайп вверх") {
            _ = screens.getCommonScreen().swipeUp()
        }
    }
    
    func longSwipeUp() -> CommonHelper  {
        step("Несколько свайпов вверх") {
            _ = screens.getCommonScreen().swipeUp().swipeUp().swipeUp().swipeUp()
        }
        return self
    }
    
    func longSwipeDown() {
        step("Несколько свайпов вниз") {
            _ = screens.getCommonScreen().swipeDown().swipeDown().swipeDown().swipeDown()
        }
    }
    
    func tapCoordinate(xCoordinate: Double = 100, yCoordinate: Double = 100) {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
    
    func selectionDateInCalendar(day: String, month: String, year: String) {
        step("Выбор даты в календаре") {
            screens.getCommonScreen().selectDateInCalendar(day: day, month: month, year: year)
        }
    }
    
    func tapOnDoneButton() {
        step("Нажатие кнопки 'Done' на клавиатуре") {
            screens.getCommonScreen().getDoneButton().tap()
        }
    }
    
    func allowGeolocation() -> CommonHelper {
        step("Разрешение использования геолокации") {
            if screens.getCommonScreen().getGeolocationTitle().exists {
                screens.getCommonScreen().getContinueButton().tap()
                screens.getCommonScreen().getNotAllowButton().forceTap()
            }
        }
        return self
    }
    
    func skipOnboarding() {
        step("Пропуск онбординга") {
            if screens.getCommonScreen().getSkipButton().exists {
                screens.getCommonScreen().getSkipButton().tap()
            }
        }
    }
    
    func goToMainScreen() {
        step("Переход на экран 'Главный'") {
            screens.getCommonScreen().getMainScreenNavigationIcon().tap()
        }
    }
    
    func checkMainScreenButton() -> CommonHelper {
        step("Кнопка 'Главный' отображается") {
            XCTAssertTrue(screens.getCommonScreen().getMainScreenNavigationIcon().waitForHittable(timeout: ENV.timeout))
        }
        return self
    }
    
    func goToPharmacy() {
        step("Переход на экран 'Аптека'") {
            screens.getCommonScreen().getPharmacyNavigationIcon().tap()
        }
    }
    
    func goToAppointment() {
        step("Переход на экран 'Запись'") {
            screens.getCommonScreen().getAppointmentNavigationIcon().tap()
        }
    }
    
    func goToMedicalCard() {
        step("Переход на экран 'Медкарта'") {
            screens.getCommonScreen().getMedicalCardNavigationIcon().tap()
        }
    }
    
    func goToMore() {
        step("Переход на экран 'Еще'") {
            screens.getCommonScreen().getMoreNavigationIcon().tap()
        }
    }
    
    func waitLoading() {
        var count = 0
        while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.flakyTimeout)) {
            count += 1
            sleep(1)
        }
    }
}
