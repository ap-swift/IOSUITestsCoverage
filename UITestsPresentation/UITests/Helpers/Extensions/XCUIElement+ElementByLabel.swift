import Foundation
import XCTest

extension XCUIElement {
    func elementBy(label: String) -> XCUIElement {
        let predicate = NSPredicate(format: "label LIKE %@", label)
        return XCUIApplication().staticTexts.element(matching: predicate)
    }
}
