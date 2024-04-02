//
//  XCUIEIement+clearText.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

import Foundation
import XCTest

extension XCUIElement {
    func clearText() {
        guard let stringValue = value as? String else {
            XCTFail("Tried to clear")
            return
        }
        tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        typeText(deleteString)
    }
}
