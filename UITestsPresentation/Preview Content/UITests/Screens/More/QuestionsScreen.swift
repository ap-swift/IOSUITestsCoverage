//
//  QuestionsScreen.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 29.01.2024.
//

import XCTest
private typealias S = QuestionsScreenSelector
private typealias ENV = UITestEnvConfig

final class QuestionsScreen {
    private let app: XCUIApplication = XCUIApplication()
    
    private var pageTitle: XCUIElement?
    private var othenQuestionsTitle: XCUIElement?
    private var myQuestionsTitle: XCUIElement?
    private var searchField: XCUIElement?
    
    private var popularitySectionTitle: XCUIElement?
    private var questionTitle: XCUIElement?
    private var emptyQuestionTitle: XCUIElement?
    
    func getPageTitle() -> XCUIElement {
        self.pageTitle = app.navigationBars[S.pageTitle]
        return pageTitle!
    }
    
    func getOthenQuestionsTitle() -> XCUIElement {
        self.othenQuestionsTitle = app.buttons[S.othenQuestionsTitle]
        XCTAssertTrue(othenQuestionsTitle!.waitForHittable(timeout: ENV.timeout))
        return othenQuestionsTitle!
    }
    
    func getMyQuestionsTitle() -> XCUIElement {
        self.myQuestionsTitle = app.buttons[S.myQuestionsTitle]
        XCTAssertTrue(myQuestionsTitle!.waitForHittable(timeout: ENV.timeout))
        return myQuestionsTitle!
    }
    
    func getSearchField() -> XCUIElement {
        self.searchField = app.searchFields.element
        XCTAssertTrue(searchField!.waitForHittable(timeout: ENV.timeout))
        return searchField!
    }
    
    func getPopularitySectionTitle() -> XCUIElement {
        self.popularitySectionTitle = app.staticTexts[S.popularitySectionTitle]
        return popularitySectionTitle!
    }
    
    func getQuestionTitle(index: Int) -> XCUIElement {
        self.questionTitle = app.cells.staticTexts.allElementsBoundByIndex[index]
        return questionTitle!
    }
    
    func getEmptyQuestionTitle() -> XCUIElement {
        self.emptyQuestionTitle = app.staticTexts[S.emptyQuestionTitle]
        return emptyQuestionTitle!
    }
}
