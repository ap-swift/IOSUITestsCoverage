import Foundation
import XCTest

class CoordinatePress {
    let app = XCUIApplication()
    
    func pressCoordinate(value: String, xCoordinate: Double, yCoordinate: Double) {
        let element = app.staticTexts[value]
        let from = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let to = element.coordinate(withNormalizedOffset: CGVector(dx: xCoordinate, dy: yCoordinate))
        from.press(forDuration: 0, thenDragTo: to)
    }
}
