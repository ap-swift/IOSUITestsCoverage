//
//  UISettingsTests.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 30.01.2024.
//

final class UISettingsTests: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Team name")
        feature("Settings")
    }
    
    func testSettingsElements() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .goToSettings()
        
        h.getSettingsScreenHelper()
            .checkSettingsScreenElements()
    }
    
    func testSettingsChangeTheme() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .goToSettings()
        
        h.getSettingsScreenHelper()
            .goToTheme()
            .changeThemeApp()
    }
    
    func testSettingsChangeNotifications() {
        h.getAuthorizationHelper()
            .authByPhone(user:  Users.shared.createUser(type: .main))
        
        h.getCommonHelper()
            .checkMainScreenButton()
            .goToMore()
        
        h.getMoreScreensHelper()
            .goToSettings()
        
        h.getSettingsScreenHelper()
            .goToNotifications()
            .checkNotifications()
    }
}
