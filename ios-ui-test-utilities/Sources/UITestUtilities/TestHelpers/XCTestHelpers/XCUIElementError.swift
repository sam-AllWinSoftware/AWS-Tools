import Foundation

public enum XCUIElementError: Error {
    case elementNotFound
    case cannotClearNonTextValue
    case cannotGetTextFromNonTextField
}
