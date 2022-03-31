import Foundation
import XCTest
import UITestUtilitiesApp

public extension XCUIElement {
    
    func getText() throws -> String? {
        
        guard [.textField, .secureTextField, .textView].contains(elementType) else {
            throw XCUIElementError.cannotGetTextFromNonTextField
        }
        
        var value: String
        switch self.elementType {
        case .staticText:
            value = self.label
        default:
            value = self.value as? String ?? ""
        }
        
        return value
    }
    
    /// Clears text in TextField, SecureTextField, TextView Element
    func clearText() throws {
        
        guard [.textField, .secureTextField, .textView].contains(elementType), let stringValue = self.value as? String else {
            throw XCUIElementError.cannotClearNonTextValue
        }
        
        if self.elementType == .textView {
            let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
            lowerRightCorner.tap()
        }
        
        let deleteString = stringValue.map { _ in XCUIKeyboardKey.delete.rawValue }.joined(separator: "")
        self.typeText(deleteString)
    }
    
    func copyPasteText(application: XCUIApplication, text: String) {
        UIPasteboard.general.string = text
        doubleTap()
        application.menuItems["Paste"].tap()
    }
}
