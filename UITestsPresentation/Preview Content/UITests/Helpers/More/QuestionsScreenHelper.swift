//
//  QuestionsScreenHelper.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 29.01.2024.
//

import XCTest
private typealias ENV = UITestEnvConfig

final class QuestionsScreenHelper: XCTest {
    private let screens: ScreensManager
    
    init(screenManager: ScreensManager) {
        self.screens = screenManager
    }
    
    func tapOnOthenQuestionSection() -> QuestionsScreenHelper {
        step("Нажатие на вкладку 'Частые вопросы'") {
            screens.getQuestionsScreen().getOthenQuestionsTitle().tap()
        }
        return self
    }
    
    func tapOnMyQuestionSection() -> QuestionsScreenHelper {
        step("Нажатие на вкладку 'Мои обращения'") {
            screens.getQuestionsScreen().getMyQuestionsTitle().tap()
        }
        return self
    }
    
    func checkEmptySection() -> QuestionsScreenHelper {
        step("Проверка пустого списка обращений") {
            XCTAssertTrue(screens.getQuestionsScreen().getEmptyQuestionTitle().isHittable)
        }
        return self
    }
    
    func checkPopularityQuestions() -> QuestionsScreenHelper {
        step("Проверка популярного списка вопросов") {
            XCTAssertTrue(screens.getQuestionsScreen().getPopularitySectionTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getQuestionsScreen().getQuestionTitle(index: 0).isHittable)
            XCTAssertTrue(screens.getQuestionsScreen().getQuestionTitle(index: 1).isHittable)
            XCTAssertTrue(screens.getQuestionsScreen().getQuestionTitle(index: 2).isHittable)
        }
        return self
    }
    
    func goToQuestion(index: Int) -> QuestionsScreenHelper {
        step("Переход к вопросу под номером: '\(index)'") {
            screens.getQuestionsScreen().getQuestionTitle(index: index).tap()
        }
        return self
    }
    
    func checkQuestion() {
        step("Проверка деталей вопроса") {
            XCTAssertTrue(screens.getQuestionScreen().getPageTitle().waitForHittable(timeout: ENV.timeout))
            XCTAssertTrue(screens.getQuestionScreen().getQuestionTitle().isHittable)
            XCTAssertTrue(screens.getQuestionScreen().getQuestionsubTitle().isHittable)
            
            XCTAssertTrue(screens.getQuestionScreen().getRatingTitle().isHittable)
            XCTAssertTrue(screens.getQuestionScreen().getRatingDislike().isHittable)
            screens.getQuestionScreen().getRatingLike().tap()
            screens.getQuestionScreen().getCancelRationButton().tap()
            
            XCTAssertTrue(screens.getQuestionScreen().getSameQuestionsTitle().isHittable)
            XCTAssertTrue(screens.getQuestionScreen().getQuestionTitle(index: 0).isHittable)
            XCTAssertTrue(screens.getQuestionScreen().getQuestionTitle(index: 1).isHittable)
            XCTAssertTrue(screens.getQuestionScreen().getQuestionTitle(index: 2).isHittable)
            
            XCTAssertTrue(screens.getQuestionScreen().getChatTitle().isHittable)
            screens.getQuestionScreen().getChatButton().tap()
        }
    }
}
