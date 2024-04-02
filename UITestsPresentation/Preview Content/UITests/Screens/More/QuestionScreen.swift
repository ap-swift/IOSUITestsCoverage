//
//  QuestionScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 29.01.2024.
//

import XCTest
private typealias S = QuestionsScreenSelector
private typealias ENV = UITestEnvConfig

final class QuestionScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var questionTitle: XCUIElement?
    private var questionsubTitle: XCUIElement?
    
    private var ratingTitle: XCUIElement?
    private var ratingLike: XCUIElement?
    private var ratingDislike: XCUIElement?
    
    private var sameQuestionsTitle: XCUIElement?
    private var questionCell: XCUIElement?
    
    private var chatTitle: XCUIElement?
    private var chatButton: XCUIElement?
    private var cancelRationButton: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars.element
        return pageTitle!
    }
    
    func getQuestionTitle() -> XCUIElement {
        self.questionTitle = app.tables.otherElements.firstMatch.staticTexts.element
        return questionTitle!
    }
    
    func getQuestionsubTitle() -> XCUIElement {
        self.questionsubTitle = app.webViews.staticTexts.element
        return questionsubTitle!
    }
    
    func getRatingTitle() -> XCUIElement {
        self.ratingTitle = app.textViews.allElementsBoundByIndex[1]
        return ratingTitle!
    }
    
    func getRatingLike() -> XCUIElement {
        self.ratingLike = app.buttons[S.fingerRatingLike]
        return ratingLike!
    }
    
    func getRatingDislike() -> XCUIElement {
        self.ratingDislike = app.buttons[S.fingerRatingDislike]
        return ratingDislike!
    }
    
    func getSameQuestionsTitle() -> XCUIElement {
        self.sameQuestionsTitle = app.staticTexts[S.sameQuestionsTitle]
        return sameQuestionsTitle!
    }
    
    func getQuestionTitle(index: Int) -> XCUIElement {
        self.questionCell = app.cells.staticTexts.allElementsBoundByIndex[index]
        XCTAssertTrue(questionCell!.waitForHittable(timeout: ENV.timeout))
        return questionCell!
    }
    
    func getChatTitle() -> XCUIElement {
        self.chatTitle = app.staticTexts[S.chatTitle]
        return chatTitle!
    }
    
    func getChatButton() -> XCUIElement {
        self.chatButton = app.buttons[S.chatButton]
        return chatButton!
    }
    
    func getCancelRationButton() -> XCUIElement {
        self.cancelRationButton = app.buttons[S.cancelRationButton]
        return cancelRationButton!
    }
}
