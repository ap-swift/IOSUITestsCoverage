//
//  UIChatTests.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 30.01.2024.
//

final class UIChatTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Chat")
    }
    
    func testSendMessageInChat() {
        let message = "".randomString(length: 30)
        
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .goToChat()
        
        h.getChatScreenHelper()
            .checkMessageInChat(message: message)
    }
}
