//
//  ScreenManager.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

final class ScreensManager {
    // common
    private let commonScreen: CommonScreen
    private let smsCodeScreen: SmsCodeScreen
    
    // auth
    private let authScreen: AuthorizationScreen
    private let passwordScreen: PasswordScreen
    private let pinCodeScreen: PinCodeScreen
    
    // registration
    private let registrationScreen: RegistrationScreen
    private let registrationUserTypeScreen: RegistrationUserTypeScreen
    
    // appointments
    private let mainAppointmentsScreen: MainAppointmentsScreen
    private let onlineConsultationFirstScreen: OnlineConsultationFirstScreen
    private let appointmentAttentionScreen: AppointmentAttentionScreen
    private let appointmentConfirmationScreen: AppointmentConfirmationScreen
    private let appointmentSuccessScreen: AppointmentSuccessScreen
    private let appointmentDateSreen: AppointmentDateSreen
    private let appointmentConfirmationClinicScreen: AppointmentConfirmationClinicScreen
    private let appointmentAddressScreen: AppointmentAddressScreen
    private let appointmentServiceScreen: AppointmentServiceScreen
    private let appointmentFillingApplicationHomeScreen: AppointmentFillingApplicationHomeScreen
    private let appointmentConfirmationHomeScreen: AppointmentConfirmationHomeScreen
    private let appointmentClinicsScreen: AppointmentClinicsScreen
    private let doctorsScreen: DoctorsScreen
    private let doctorScreen: DoctorScreen
    private let clinicScreen: ClinicScreen
    private let appointmentSuccessClinicScreen: AppointmentSuccessClinicScreen
    
    // more screens
    private let moreScreen: MoreScreen
    private let aboutAppScreen: AboutAppScreen
    private let thanksScreen: ThanksScreen
    private let chatScreen: ChatScreen
    private let questionsScreen: QuestionsScreen
    private let questionScreen: QuestionScreen
    private let settingsScreen: SettingsScreen
    private let notificationsScreen: NotificationsScreen
    private let profileScreen: ProfileScreen
    
    init() {
        // common
        self.commonScreen = CommonScreen()
        self.smsCodeScreen = SmsCodeScreen()
        
        // auth
        self.authScreen = AuthorizationScreen()
        self.passwordScreen = PasswordScreen()
        self.pinCodeScreen = PinCodeScreen()
        
        // registration
        self.registrationScreen = RegistrationScreen()
        self.registrationUserTypeScreen = RegistrationUserTypeScreen()
        
        // appointments
        self.mainAppointmentsScreen = MainAppointmentsScreen()
        self.onlineConsultationFirstScreen = OnlineConsultationFirstScreen()
        self.appointmentAttentionScreen = AppointmentAttentionScreen()
        self.appointmentConfirmationScreen = AppointmentConfirmationScreen()
        self.appointmentSuccessScreen = AppointmentSuccessScreen()
        self.appointmentDateSreen = AppointmentDateSreen()
        self.appointmentConfirmationClinicScreen = AppointmentConfirmationClinicScreen()
        self.appointmentAddressScreen = AppointmentAddressScreen()
        self.appointmentServiceScreen = AppointmentServiceScreen()
        self.appointmentFillingApplicationHomeScreen = AppointmentFillingApplicationHomeScreen()
        self.appointmentConfirmationHomeScreen = AppointmentConfirmationHomeScreen()
        self.appointmentClinicsScreen = AppointmentClinicsScreen()
        self.doctorsScreen = DoctorsScreen()
        self.doctorScreen = DoctorScreen()
        self.clinicScreen = ClinicScreen()
        self.appointmentSuccessClinicScreen = AppointmentSuccessClinicScreen()
        
        // more screen
        self.moreScreen = MoreScreen()
        self.aboutAppScreen = AboutAppScreen()
        self.thanksScreen = ThanksScreen()
        self.chatScreen = ChatScreen()
        self.questionsScreen = QuestionsScreen()
        self.questionScreen = QuestionScreen()
        self.settingsScreen = SettingsScreen()
        self.notificationsScreen = NotificationsScreen()
        self.profileScreen = ProfileScreen()
    }
    
    // common
    func getCommonScreen() -> CommonScreen { return self.commonScreen }
    func getSmsCodeScreen() -> SmsCodeScreen { return self.smsCodeScreen }
    
    // auth
    func getAuthorizationScreen() -> AuthorizationScreen { return self.authScreen }
    func getPasswordScreen() -> PasswordScreen { return self.passwordScreen }
    func getPinCodeScreen() -> PinCodeScreen { return self.pinCodeScreen }
    
    // registration
    func getRegistrationScreen() -> RegistrationScreen { return self.registrationScreen }
    func getRegistrationUserTypeScreen() -> RegistrationUserTypeScreen { return self.registrationUserTypeScreen }
    
    // appointments
    func getMainAppointmentsScreen() -> MainAppointmentsScreen { return self.mainAppointmentsScreen }
    func getOnlineConsultationFirstScreen() -> OnlineConsultationFirstScreen { return self.onlineConsultationFirstScreen }
    func getAppointmentAttentionScreen() -> AppointmentAttentionScreen { return self.appointmentAttentionScreen }
    func getAppointmentConfirmationScreen() -> AppointmentConfirmationScreen { return self.appointmentConfirmationScreen }
    func getAppointmentSuccessScreen() -> AppointmentSuccessScreen { return self.appointmentSuccessScreen }
    func getAppointmentDateSreen() -> AppointmentDateSreen { return self.appointmentDateSreen }
    func getAppointmentConfirmationClinicScreen() -> AppointmentConfirmationClinicScreen { return self.appointmentConfirmationClinicScreen }
    func getAppointmentAddressScreen() -> AppointmentAddressScreen { return self.appointmentAddressScreen }
    func getAppointmentServiceScreen() -> AppointmentServiceScreen { return self.appointmentServiceScreen }
    func getAppointmentFillingApplicationHomeScreen() -> AppointmentFillingApplicationHomeScreen { return self.appointmentFillingApplicationHomeScreen }
    func getAppointmentConfirmationHomeScreen() -> AppointmentConfirmationHomeScreen { return self.appointmentConfirmationHomeScreen }
    func getAppointmentClinicsScreen() -> AppointmentClinicsScreen { return self.appointmentClinicsScreen }
    func getDoctorsScreen() -> DoctorsScreen { return self.doctorsScreen }
    func getDoctorScreen() -> DoctorScreen { return self.doctorScreen }
    func getClinicScreen() -> ClinicScreen { return self.clinicScreen }
    func getAppointmentSuccessClinicScreen() -> AppointmentSuccessClinicScreen { return self.appointmentSuccessClinicScreen }
    
    // more
    func getMoreScreen() -> MoreScreen { return self.moreScreen }
    func getAboutAppScreen() -> AboutAppScreen { return self.aboutAppScreen }
    func getThanksScreen() -> ThanksScreen { return self.thanksScreen }
    func getChatScreen() -> ChatScreen { return self.chatScreen }
    func getQuestionsScreen() -> QuestionsScreen { return self.questionsScreen }
    func getQuestionScreen() -> QuestionScreen { return self.questionScreen }
    func getSettingsScreen() -> SettingsScreen { return self.settingsScreen }
    func getNotificationsScreen() -> NotificationsScreen { return self.notificationsScreen }
    func getProfileScreen() -> ProfileScreen { return self.profileScreen }
}
