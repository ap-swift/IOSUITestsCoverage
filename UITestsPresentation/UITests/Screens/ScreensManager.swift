//
//  ScreenManager.swift
//  ProjectUITests
//
//  Created by Artem Parfenov on 02.04.2024.
//

import XCTest

final class ScreensManager {

    private let commonScreen: CommonScreen
    private let welcomeScreen: WelcomeScreen
    private let autosListScreen: AutosListScreen
    private let carScreen: CarScreen

    init() {
        self.commonScreen = CommonScreen()
        self.welcomeScreen = WelcomeScreen()
        self.autosListScreen = AutosListScreen()
        self.carScreen = CarScreen()
    }

    func getCommonScreen() -> CommonScreen { return self.commonScreen }
    func getWelcomeScreen() -> WelcomeScreen { return self.welcomeScreen }
    func getAutosListScreen() -> AutosListScreen { return self.autosListScreen }
    func getCarScreen() -> CarScreen { return self.carScreen }

}
