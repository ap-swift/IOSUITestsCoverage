//
//  MoreScreensHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 24.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class MoreScreensHelper: XCTest {
    private let screens: ScreensManager
    private let apiAuthorization = ApiAuthorization()
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func checkMoreScreenElemets() {
        step("Проверка элементов на странице 'Еще'") {
            if screens.getMoreScreen().getDoneButton().waitForHittable(timeout: ENV.timeout) {
                screens.getMoreScreen().getDoneButton().tap()
            }
            XCTAssertTrue(screens.getMoreScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getMoreScreen().getQrCodeButton().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getProfileImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getProfileTitle().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getProfileDesc().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getBonusesImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getBonusesTitle().waitForHittable(timeout: ENV.flakyTimeout))
            
            XCTAssertTrue(screens.getMoreScreen().getMyFamilyImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getMyFamilyTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getMyActivityImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getMyActivityTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getMyCalendarImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getMyCalendarTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getPromocodeImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getPromocodeTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getWalletImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getWalletTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getSettingsImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getSettingsTitle().isHittable)
            
            _ = screens.getCommonScreen().swipeUp()
            
            XCTAssertTrue(screens.getMoreScreen().getQuestionsImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getQuestionsTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getChatImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getChatTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getAboutAppImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getAboutAppTitle().isHittable)
            
            XCTAssertTrue(screens.getMoreScreen().getThanksImage().isHittable)
            XCTAssertTrue(screens.getMoreScreen().getThanksTitle().isHittable)
        }
    }
    
    func checkAboutAppPageElements() {
        step("Проверка элементов на странице 'О Приложении") {
            XCTAssertTrue(screens.getAboutAppScreen().getPageTitle().isHittable)
            XCTAssertTrue(screens.getAboutAppScreen().getAppImage().exists)
            XCTAssertTrue(screens.getAboutAppScreen().getAppVersion().isHittable)
            XCTAssertTrue(screens.getAboutAppScreen().getUserAgreementTitle().isHittable)
            XCTAssertTrue(screens.getAboutAppScreen().getAdditionalInformationTitle().isHittable)
            XCTAssertTrue(screens.getAboutAppScreen().getMedsiTitle().isHittable)
            
            screens.getAboutAppScreen().getBackButton().tap()
        }
    }
    
    func checkThanksPageElements() {
        step("Проверка элементов на странице 'Спасибо, МЕДСИ'") {
            if screens.getMoreScreen().getDoneButton().waitForHittable(timeout: ENV.timeout) {
                screens.getMoreScreen().getDoneButton().tap()
            }
            XCTAssertTrue(screens.getThanksScreen().getPageTitle().isHittable)
            for index in 0...5 {
                XCTAssertTrue(screens.getThanksScreen().getProgramText(index: index).isHittable)
            }
            screens.getThanksScreen().getProgramButton().tap()
            XCTAssertTrue(screens.getThanksScreen().getWebViewTitle().isHittable)
        }
    }
    
    func goToProfile() {
        step("Переход в профиль") {
            screens.getMoreScreen().getProfileTitle().tap()
        }
    }
    
    func goToBonuses() {
        step("Переход в бонусы") {
            screens.getMoreScreen().getBonusesTitle().tap()
        }
    }
    
    func goToMyFamily() {
        step("Переход в профиль") {
            screens.getMoreScreen().getMyFamilyTitle().tap()
        }
    }
    
    func goToMyActivity() {
        step("Переход в мою активность") {
            screens.getMoreScreen().getMyActivityTitle().tap()
        }
    }
    
    func goToMyCalendar() {
        step("Переход мой календарь") {
            screens.getMoreScreen().getMyCalendarTitle().tap()
        }
    }
    
    func goToPromocode() {
        step("Переход в промокоды") {
            screens.getMoreScreen().getPromocodeTitle().tap()
        }
    }
    
    func goToWallet() {
        step("Переход в кошелек") {
            screens.getMoreScreen().getWalletTitle().tap()
        }
    }
    
    func goToSettings() {
        step("Переход в настройки") {
            screens.getMoreScreen().getSettingsTitle().tap()
        }
    }
    
    func goToQuestions() {
        step("Переход в вопросы") {
            screens.getMoreScreen().getQuestionsTitle().tap()
        }
    }
    
    func goToChat() {
        step("Переход в вопросы") {
            screens.getMoreScreen().getChatTitle().tap()
        }
    }
    
    func goToAboutApp() -> MoreScreensHelper {
        step("Переход в раздел о приложении") {
            screens.getMoreScreen().getAboutAppTitle().tap()
        }
        return self
    }
    
    func goToThanksPage() -> MoreScreensHelper {
        step("Переход в раздел 'Спасибо'") {
            screens.getMoreScreen().getThanksTitle().tap()
        }
        return self
    }
}
