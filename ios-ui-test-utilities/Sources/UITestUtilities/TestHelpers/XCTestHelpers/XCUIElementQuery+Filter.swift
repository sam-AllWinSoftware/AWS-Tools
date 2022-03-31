import Foundation
import XCTest

public extension XCUIElementQuery {
    func filter(predicate: NSPredicate) -> XCUIElement {
       return self.matching(predicate).firstMatch
    }
}
