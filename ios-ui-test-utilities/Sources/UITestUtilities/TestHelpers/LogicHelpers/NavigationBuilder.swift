import Foundation
import XCTest
import UITestUtilitiesApp

public protocol CollectionViewIdentifiable {
    @discardableResult
    func swipeTo(collectionView: UIAccessibilityId) -> CellIdentifiable
    @discardableResult
    func swipeTo(collectionView index: Int) -> CellIdentifiable
}

public protocol CellIdentifiable {
    @discardableResult
    func cell(index: Int) -> XCUIElement?
    @discardableResult
    func cell(row: Int, col: Int) -> XCUIElement?
    @discardableResult
    func cell(element: UIAccessibilityId) -> XCUIElement?
}

public protocol ElementInteractuable {
    @discardableResult
    func tap(element: UIAccessibilityId) -> Self
    @discardableResult
    func type(element: UIAccessibilityId, text: String) -> Self
    @discardableResult
    func swipe(by identifier: UIAccessibilityId) -> Self
    @discardableResult
    func swipe(by index: Int, elementType: XCUIElement.ElementType) -> Self
}

public final class NavigationBuilder: CollectionViewIdentifiable, CellIdentifiable, ElementInteractuable {
    
     let app: XCUIApplication
     var xcuiElement: XCUIElement?
    
    public init(app: XCUIApplication) {
        self.app = app
    }
    
    @discardableResult
    public func cell(index: Int) -> XCUIElement? {
        cell(row: index, col: 0)
    }
    
    @discardableResult
    public func cell(row: Int, col: Int) -> XCUIElement? {
        guard let xcuiElement = xcuiElement else {
            return nil
        }
        app.scrollToLastCell(collectionView: xcuiElement)
        return xcuiElement.cells.element(boundBy: 0)
    }
    
    @discardableResult
    public func cell(element: UIAccessibilityId) -> XCUIElement? {
        guard let xcuiElement = xcuiElement else {
            return nil
        }
        app.findCellById(collectionView: xcuiElement, cell: element)
        let cellType = XCUIElement.ElementType(rawValue: element.elementType.rawValue) ?? .cell
        return xcuiElement.descendants(matching: cellType).matching(identifier: element.accessibilityIdentifier).firstMatch
    }
    
    /// Sets a new Date in pickerwells control
    ///
    /// - parameter option: A single component to add.
    /// - parameter target: The value to set in date.
    /// - parameter dateFormat: The starting date format.
    @discardableResult
    public func pick(option: Calendar.Component, target: String, dateFormat: String) -> Self {
        let date = getDateInCustomFormat(days: 0, dateFormat: dateFormat)
        let dateValue: String
        switch option {
        case .month:
            let month = Calendar.current.component(.month, from: date)
            dateValue = Calendar.current.monthSymbols[month - 1]
        case .day:
            let day = Calendar.current.component(.day, from: date)
            dateValue = String(day)
        default:
            let year = Calendar.current.component(.year, from: date)
            dateValue = String(year)
        }
        app.pickerWheels[dateValue].adjust(toPickerWheelValue: target)
        return self
    }
    
    func getDateInCustomFormat(days: Int, dateFormat: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard let date = Calendar.current.date(byAdding: .day, value: days, to: Date()) else {
            XCTFail("Unable to create Date by adding \(days) days to today")
            return Date()
        }
        return date
    }
    
    @discardableResult
    public func group(_ text: String = "Activity group", closure: (_ activity: XCTActivity) -> Void) -> Self {
        XCTContext.runActivity(named: text) { activity in
            closure(activity)
        }
        return self
    }
    
    @discardableResult
    public func screenshot(activity: XCTActivity, _ name: String = "Screenshot") -> Self {
        let screen: XCUIScreen = XCUIScreen.main
        let fullScreenshotAttachment: XCTAttachment = XCTAttachment(screenshot: screen.screenshot())
        fullScreenshotAttachment.name = name
        fullScreenshotAttachment.lifetime = .keepAlways
        activity.add(fullScreenshotAttachment)
        return self
    }
    
    public func screenshot(groupName: String = "--- Screenshot ---", _ name: String = "Screenshot") {
        group(groupName) { (activity) in
            screenshot(activity: activity, name)
        }
    }
    
}
