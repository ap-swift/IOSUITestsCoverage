//
//  ChatScreenHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class ChatScreenHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func checkChatWithDoctor() {
        step("Проверка открытия чата с доктором") {
            if screens.getCommonScreen().getAllowButton().waitForHittable(timeout: ENV.timeout) {
                screens.getCommonScreen().getAllowButton().forceTap()
            }
            if screens.getCommonScreen().getAllowButton().isHittable {
                screens.getCommonScreen().getAllowButton().forceTap()
            }
            XCTAssertTrue(screens.getChatScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getChatScreen().getBackButton().isHittable)
            XCTAssertTrue(screens.getChatScreen().getMoreButton().isHittable)
            XCTAssertTrue(screens.getChatScreen().getContentTitle().isHittable)
            XCTAssertTrue(screens.getChatScreen().getContentSubtitle().isHittable)
            XCTAssertTrue(screens.getChatScreen().getAttachFileButton().isHittable)
            XCTAssertTrue(screens.getChatScreen().getSendButton().isHittable)
        }
    }
    
    func checkSupportScreen() {
        step("Проверка открытия чата с поддержкой") {
            XCTAssertTrue(screens.getChatScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getChatScreen().getBackButton().isHittable)
            XCTAssertTrue(screens.getChatScreen().getSendSupportButton().isHittable)
        }
    }
    
    func checkMessageInChat(message: String) {
        step("Отправка и проверка сообщения в чате") {
            XCTAssertTrue(screens.getChatScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getChatScreen().getBackButton().isHittable)
            
            screens.getChatScreen().getTextField().tap()
            screens.getChatScreen().getTextField().typeText(message)
            _ = screens.getCommonScreen().swipeUp()
            
            screens.getChatScreen().getSendSupportButton().forceTap()
            var count = 0
            while (screens.getCommonScreen().getLoadingIndicator().isHittable && count < Int(ENV.timeout)) {
                count += 1
                sleep(1)
            }
            XCTAssertEqual(message, screens.getChatScreen().getLastMessageInChat().label)
        }
    }
}
