//
//  XCUIElement+ElementByLabel.swift
//  UITests
//
//  Created by PETROV Vladimir on 01.02.2024.
//

import Foundation
import XCTest

extension XCUIElement {
    func elementBy(label: String) -> XCUIElement {
        let predicate = NSPredicate(format: "label LIKE %@", label)
        return XCUIApplication().staticTexts.element(matching: predicate)
    }
}
