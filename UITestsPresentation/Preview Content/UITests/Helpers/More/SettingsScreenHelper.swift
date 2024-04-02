//
//  SettingsScreenHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 30.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig
private typealias TD = AppThemeTestData
private typealias N_TD = NotificationTestData

final class SettingsScreenHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func goToMyCalendar() {
        step("Переход к моему календарю") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            screens.getSettingsScreen().getMycalendarTitle().tap()
        }
    }
    
    func goToNotifications() -> SettingsScreenHelper {
        step("Переход в уведомления") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            screens.getSettingsScreen().getNotificationTitle().tap()
        }
        return self
    }
    
    func goToTheme() -> SettingsScreenHelper {
        step("Переход к настройке темы приложения") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            screens.getSettingsScreen().getThemeTitle().tap()
        }
        return self
    }
    
    func goToChangePassword() {
        step("Переход к изменению пароля") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            screens.getSettingsScreen().getChangePasswordTitle().tap()
        }
    }
    
    func goToDeleteAcc() {
        step("Переход к удалению аккаунта") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            screens.getSettingsScreen().getDeleteAccTitle().tap()
        }
    }
    
    func checkSettingsScreenElements() {
        step("Проверка экрана настроек") {
            XCTAssertTrue(screens.getSettingsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getSettingsScreen().getFaceIdTitle().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getFaceIdSwitcher().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getNotificationTitle().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getMycalendarTitle().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getChangePasswordTitle().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getThemeTitle().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getThemeDesc().isHittable)
            XCTAssertTrue(screens.getSettingsScreen().getDeleteAccTitle().isHittable)
        }
    }
    
    func changeThemeApp() {
        step("Изменение темы приложения") {
            screens.getSettingsScreen().getThemeValue(value: TD.darkTheme).tap()
            XCTAssertTrue(screens.getSettingsScreen().getThemeValue(value: TD.darkTheme).isHittable)
            screens.getSettingsScreen().getThemeTitle().tap()
            screens.getSettingsScreen().getThemeValue(value: TD.systemTheme).tap()
            XCTAssertTrue(screens.getSettingsScreen().getThemeValue(value: TD.systemTheme).isHittable)
        }
    }
    
    func checkNotifications() {
        step("Проверка уведомлений") {
            XCTAssertTrue(screens.getNotificationsScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            
            XCTAssertTrue(screens.getNotificationsScreen().getPromoTitle().isHittable)
            XCTAssertTrue(screens.getNotificationsScreen().getPromoDesc().isHittable)
            XCTAssertEqual("1", screens.getNotificationsScreen().getPromoSwitcher().value as? String)
            screens.getNotificationsScreen().getPromoSwitcher().tap()
            XCTAssertEqual("0", screens.getNotificationsScreen().getPromoSwitcher().value as? String)
            screens.getNotificationsScreen().getPromoSwitcher().tap()
            XCTAssertEqual("1", screens.getNotificationsScreen().getPromoSwitcher().value as? String)
            
            XCTAssertTrue(screens.getNotificationsScreen().getCompleteTitle().isHittable)
            XCTAssertTrue(screens.getNotificationsScreen().getCompleteDesc().isHittable)
            XCTAssertTrue(screens.getNotificationsScreen().getCompleteValue(value: N_TD.pushValue).isHittable)
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                count += 1
                sleep(1)
            }
            screens.getNotificationsScreen().getCompleteTitle().tap()
            _ = screens.getNotificationsScreen().getCompleteValue(value: N_TD.callValue).waitForHittable(timeout: ENV.timeout)
            screens.getNotificationsScreen().getCompleteValue(value: N_TD.callValue).tap()
            XCTAssertTrue(screens.getNotificationsScreen().getCompleteValue(value: N_TD.callValue).isHittable)
            var secondCount = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                secondCount += 1
                sleep(1)
            }
            screens.getNotificationsScreen().getCompleteTitle().tap()
            _ = screens.getNotificationsScreen().getCompleteValue(value: N_TD.pushLongValue).waitForHittable(timeout: ENV.timeout)
            screens.getNotificationsScreen().getCompleteValue(value: N_TD.pushLongValue).tap()
            XCTAssertTrue(screens.getNotificationsScreen().getCompleteValue(value: N_TD.pushValue).isHittable)
        }
    }
}
