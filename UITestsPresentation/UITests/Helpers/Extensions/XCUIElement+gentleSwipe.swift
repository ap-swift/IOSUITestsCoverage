import Foundation
import XCTest

extension XCUIElement {
    enum direction: Int {
        case Up, Down, Left, Right
    }
    
    func gentleSwipe(_ direction: direction) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.5
        let pressDuration: TimeInterval = 0.01
        
        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment
        
        let centre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))
        
        switch direction {
        case .Up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
        case .Down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
        case .Left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
        case .Right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
        }
    }
}
