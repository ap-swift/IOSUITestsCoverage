//
//  HelperManager.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

final class HelpersManager {
    private let screensManager: ScreensManager = ScreensManager()
    
    // auth
    private let authorizationHelper: AuthorizationHelper
    private let registrationHelper: RegistrationHelper
    
    // appointment
    private let appointmentsHelper: AppointmentsHelper
    private let appointmentClinicHelper: AppointmentClinicHelper
    private let doctorsHelper: DoctorsHelper
    
    // more screen helpers
    private let moreScreensHelper: MoreScreensHelper
    private let chatScreenHelper: ChatScreenHelper
    private let questionsScreenHelper: QuestionsScreenHelper
    private let settingsScreenHelper: SettingsScreenHelper
    private let profileScreenHelper: ProfileScreenHelper
    
    private var commonHelper: CommonHelper?
    
    init(){
        // auth
        self.authorizationHelper = AuthorizationHelper(screenManager: self.screensManager)
        self.registrationHelper = RegistrationHelper(screenManager: self.screensManager)
        
        // appointment
        self.appointmentsHelper = AppointmentsHelper(screenManager: self.screensManager)
        self.appointmentClinicHelper = AppointmentClinicHelper(screenManager: self.screensManager)
        self.doctorsHelper = DoctorsHelper(screenManager: self.screensManager)
        
        // more screen helpers
        self.moreScreensHelper = MoreScreensHelper(screenManager: self.screensManager)
        self.chatScreenHelper = ChatScreenHelper(screenManager: self.screensManager)
        self.questionsScreenHelper = QuestionsScreenHelper(screenManager: self.screensManager)
        self.settingsScreenHelper = SettingsScreenHelper(screenManager: self.screensManager)
        self.profileScreenHelper = ProfileScreenHelper(screenManager: self.screensManager)
    }
    
    func getScreensManager() -> ScreensManager { return self.screensManager }
    
    // auth
    func getAuthorizationHelper() -> AuthorizationHelper { return self.authorizationHelper }
    func getRegistrationHelper() -> RegistrationHelper { return self.registrationHelper }
    
    // appointment
    func getAppointmentsHelper() -> AppointmentsHelper { return self.appointmentsHelper }
    func getAppointmentClinicHelper() -> AppointmentClinicHelper { return self.appointmentClinicHelper }
    func getDoctorsHelper() -> DoctorsHelper { return self.doctorsHelper }
    
    // more screen helpers
    func getMoreScreensHelper() -> MoreScreensHelper { return self.moreScreensHelper }
    func getChatScreenHelper() -> ChatScreenHelper { return self.chatScreenHelper }
    func getQuestionsScreenHelper() -> QuestionsScreenHelper { return self.questionsScreenHelper }
    func getSettingsScreenHelper() -> SettingsScreenHelper { return self.settingsScreenHelper }
    func getProfileScreenHelper() -> ProfileScreenHelper { return self.profileScreenHelper }
    
    func getCommonHelper() -> CommonHelper {
        if (self.commonHelper == nil) { self.commonHelper = CommonHelper(helpersManager: self, screensManager: self.screensManager) }
        return self.commonHelper!
    }
}
