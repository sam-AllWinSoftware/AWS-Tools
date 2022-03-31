import Foundation
import XCTest
import UITestUtilitiesApp

public extension NavigationBuilder {
    
    /// Waits for any element previously identified to appears before the time interval
    @discardableResult
    public func wait(element: UIAccessibilityId, timeout: TimeInterval = 10) -> Self {
        let element = app.getElement(element)
        assert(assertType: .true, expression: element.waitForExistence(timeout: timeout), message: "Waited for \(timeout) seconds, element not found")
        return self
    }
    
    /// Waits for any XCUIElement to appears before the time interval
    @discardableResult
    public func wait(element: XCUIElement, timeout: TimeInterval = 10) -> Self {
        assert(assertType: .true, expression: element.waitForExistence(timeout: timeout), message: "Waited for \(timeout) seconds, element not found")
        return self
    }
    
    /// Waits for any XCUIElement to appears before the time interval
    @discardableResult
    public func wait(element index: Int, elementType: XCUIElement.ElementType, timeout: TimeInterval = 10) -> Self {
        let element = app.descendants(matching: elementType).element(boundBy: index)
        assert(assertType: .true, expression: element.waitForExistence(timeout: timeout), message: "Waited for \(timeout) seconds, element not found")
        return self
    }
    
    /// Waits for any element previously identified until it appears before the time interval
    @discardableResult
    public func waitUntilElementExists(identifier: UIAccessibilityId, timeout: TimeInterval = 10) -> Self {
        _ = app.getElement(identifier).waitForExistence(timeout: timeout)
        return self
    }
}
