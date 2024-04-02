//
//  UIAboutAppTests.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 24.01.2024.
//

final class UIAboutAppTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("More page")
    }
    
    func testMoreScreenElements() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .checkMoreScreenElemets()
    }
    
    func testAboutAppInMorePage() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getCommonHelper()
            .swipeUp()
        
        h.getMoreScreensHelper()
            .goToAboutApp()
            .checkAboutAppPageElements()
        
        h.getCommonHelper()
            .swipeUp()
        
        h.getMoreScreensHelper()
            .goToThanksPage()
            .checkThanksPageElements()
    }
    
    func testMoreScreenQuestions() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getCommonHelper()
            .swipeUp()
        
        h.getMoreScreensHelper()
            .goToQuestions()
        
        h.getQuestionsScreenHelper()
            .tapOnMyQuestionSection()
            .checkEmptySection()
            .tapOnOthenQuestionSection()
            .checkPopularityQuestions()
            .goToQuestion(index: 3)
            .checkPopularityQuestions()
            .goToQuestion(index: 0)
            .checkQuestion()
        
        h.getChatScreenHelper()
            .checkSupportScreen()
    }
}
