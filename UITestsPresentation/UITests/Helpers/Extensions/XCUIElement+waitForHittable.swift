import Foundation
import XCTest

extension XCUIElement {
    func waitForHittable(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "hittable == 1")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        return XCTWaiter().wait(for: [expectation], timeout: timeout) == .completed
    }
    
    func waitAndTab(_ text: String, _ timeout: TimeInterval = 30.0) {
        XCTAssertTrue(XCUIApplication().staticTexts[text].waitForExistence(timeout : timeout))
        XCUIApplication().staticTexts[text].tap()
    }
}
