//
//  XCUIElement+forceTap.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 19.01.2024.
//

import Foundation
import XCTest

extension XCUIElement {
    
    func forceTap() {
        if isHittable {
            tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: .zero)
            coordinate.tap()
        }
    }
}
