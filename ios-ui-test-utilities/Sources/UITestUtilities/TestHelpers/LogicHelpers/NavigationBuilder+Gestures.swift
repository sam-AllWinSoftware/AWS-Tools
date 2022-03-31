import Foundation
import XCTest
import UITestUtilitiesApp

public extension NavigationBuilder {
    
    @discardableResult func tap(element: UIAccessibilityId) -> Self {
        let element = app.getElement(element)
        element.tap()
        return self
    }
    
    @discardableResult func tap(element: XCUIElement) -> Self {
        element.tap()
        return self
    }
    
    @discardableResult func tap(identifier: String, elementType: XCUIElement.ElementType) -> Self {
        let element = app.descendants(matching: elementType).element(matching: elementType, identifier: identifier)
        element.tap()
        return self
    }
    
    @discardableResult func tap(predicate: NSPredicate, elementType: XCUIElement.ElementType) -> Self {
        let element = app.getElementByPredicate(elementType: elementType, predicate: predicate)
        element.tap()
        return self
    }
    
    @discardableResult
    public func tap(by index: Int, elementType: XCUIElement.ElementType) -> Self {
        app.descendants(matching: elementType).element(boundBy: index).tap()
        return self
    }
    
    @discardableResult func tap(parent: XCUIElement, predicateForChild: NSPredicate, elementType: XCUIElement.ElementType = .any) -> Self {
        let element = parent.descendants(matching: elementType).matching(predicateForChild).element
        element.tap()
        return self
    }
    
    @discardableResult func tap(parent: XCUIElement, identifier: String, elementType: XCUIElement.ElementType = .any) -> Self {
        let element = parent.descendants(matching: elementType).matching(identifier: identifier).element
        element.tap()
        return self
    }
    
    @discardableResult
    public func swipeTo(collectionView index: Int) -> CellIdentifiable {
        swipe(by: index, elementType: .collectionView)
        return self
    }
    
    @discardableResult
    public func swipeTo(collectionView: UIAccessibilityId) -> CellIdentifiable {
        xcuiElement = app.collectionViews[collectionView.accessibilityIdentifier]
        return self
    }
    
    @discardableResult
    public func swipe(by index: Int, elementType: XCUIElement.ElementType) -> Self {
        let element = app.descendants(matching: elementType).element(boundBy: index)
        xcuiElement = element
        app.swipe(to: element)
        return self
    }
    
    @discardableResult
    public func swipe(by identifier: UIAccessibilityId) -> Self {
        let element = app.getElement(identifier)
        xcuiElement = element
        app.swipe(to: element)
        return self
    }
    
    @discardableResult public func type(element: UIAccessibilityId, text: String) -> Self {
        let element = app.getElement(element)
        element.typeText(text)
        return self
    }
    
    @discardableResult public func type(element: XCUIElement, text: String) -> Self {
        element.typeText(text)
        return self
    }
    
    @discardableResult public func clearText(identifier: UIAccessibilityId) throws -> Self {
        let element = app.getElement(identifier)
        try element.clearText()
        return self
    }
    
    @discardableResult public func clearText(element: XCUIElement) throws -> Self {
        try element.clearText()
        return self
    }
    
    @discardableResult public func copyPasteText(identifier: UIAccessibilityId, text: String) throws -> Self {
        let element = app.getElement(identifier)
        element.copyPasteText(application: app, text: text)
        return self
    }
    
    @discardableResult public func copyPasteText(element: XCUIElement, text: String) throws -> Self {
        element.copyPasteText(application: app, text: text)
        return self
    }
    
    /// Match text in TextField or SecureTextField Element previously identified
    @discardableResult public func matchText(identifier: UIAccessibilityId, textToMatch: String) throws -> Self {
        let element = app.getElement(identifier)
        let stringValue =  try element.getText()
        XCTAssertEqual(stringValue, textToMatch)
        return self
    }
    
    /// Match text in TextField or SecureTextField Element previously identified
    @discardableResult public func matchText(element: XCUIElement, textToMatch: String) throws -> Self {
        let stringValue =  try element.getText()
        XCTAssertEqual(stringValue, textToMatch)
        return self
    }
    
}
