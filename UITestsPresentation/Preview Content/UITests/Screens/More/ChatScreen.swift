//
//  ChatScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

import XCTest
private typealias S = ChatScreenSelector
private typealias ENV = UITestEnvConfig

final class ChatScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var backButton: XCUIElement?
    private var moreButton: XCUIElement?
    
    private var contentTitle: XCUIElement?
    private var contentSubtitle: XCUIElement?
    private var lastMessageInChat: XCUIElement?
    
    private var attachFileButton: XCUIElement?
    private var textField: XCUIElement?
    private var sendButton: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars.staticTexts.firstMatch
        return pageTitle!
    }
    
    func getBackButton() -> XCUIElement {
        self.backButton = app.navigationBars.buttons.firstMatch
        XCTAssertTrue(backButton!.waitForExistence(timeout: ENV.timeout))
        return backButton!
    }
    
    func getMoreButton() -> XCUIElement {
        self.moreButton = app.buttons[S.moreButton]
        XCTAssertTrue(moreButton!.waitForHittable(timeout: ENV.timeout))
        return moreButton!
    }
    
    func getContentTitle() -> XCUIElement {
        self.contentTitle = app.textViews.textViews.firstMatch
        return contentTitle!
    }
    
    func getContentSubtitle() -> XCUIElement {
        self.contentSubtitle = app.textViews.textViews.allElementsBoundByIndex[1]
        return contentSubtitle!
    }
    
    func getLastMessageInChat() -> XCUIElement {
        self.lastMessageInChat = app.cells.firstMatch.textViews.allElementsBoundByIndex[1]
        return lastMessageInChat!
    }
    
    func getAttachFileButton() -> XCUIElement {
        self.attachFileButton = app.buttons[S.attachFileButton]
        XCTAssertTrue(attachFileButton!.waitForHittable(timeout: ENV.timeout))
        return attachFileButton!
    }
    
    func getTextField() -> XCUIElement {
        self.textField = app.otherElements.containing(.button, identifier: S.sendSupportButton).children(matching: .textView).element
        XCTAssertTrue(textField!.waitForHittable(timeout: ENV.timeout))
        return textField!
    }
    
    func getSendButton() -> XCUIElement {
        self.sendButton = app.buttons[S.sendButton]
        XCTAssertTrue(sendButton!.waitForHittable(timeout: ENV.timeout))
        return sendButton!
    }
    
    func getSendSupportButton() -> XCUIElement {
        self.sendButton = app.buttons[S.sendSupportButton]
        XCTAssertTrue(sendButton!.waitForHittable(timeout: ENV.timeout))
        return sendButton!
    }
}
