import Foundation
import XCTest
import UITestUtilitiesApp

public extension XCUIApplication {
    
    func getElement(_ element: UIAccessibilityId) -> XCUIElement {
        let elementType = XCUIElement.ElementType(rawValue: element.elementType.rawValue) ?? .any
        return descendants(matching: elementType)[element.accessibilityIdentifier].firstMatch
    }
    
    func getElementByPredicate(elementType:XCUIElement.ElementType = .any, predicate: NSPredicate) -> XCUIElement {
        return descendants(matching: elementType).matching(predicate).element
    }
    
    func printVisibleElementByType(type: XCUIElement.ElementType) {
        let elements = descendants(matching: type).allElementsBoundByIndex.enumerated().map { index, element in
            "Index: \(index)         Identifier: \(element.identifier)        Label: \(element.label)"
        }
        dump(elements)
    }
}
 
