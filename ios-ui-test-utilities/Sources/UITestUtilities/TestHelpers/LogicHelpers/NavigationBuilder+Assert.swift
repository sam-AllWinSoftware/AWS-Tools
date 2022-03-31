import Foundation
import XCTest
import UITestUtilitiesApp

public extension NavigationBuilder {
    
    @discardableResult
    public func assert<T>(assertType: _XCTAssertionType, expression1: T, expression2: T, message: String = "") -> Self where T: Comparable {
        switch assertType {
        case .equal:
            message.isEmpty ? XCTAssertEqual(expression1, expression2) : XCTAssertEqual(expression1, expression2, message)
        case .notEqual:
            message.isEmpty ? XCTAssertNotEqual(expression1, expression2) : XCTAssertNotEqual(expression1, expression2, message)
        case .greaterThan:
            message.isEmpty ? XCTAssertGreaterThan(expression1, expression2) : XCTAssertGreaterThan(expression1, expression2, message)
        case .lessThan:
            message.isEmpty ? XCTAssertLessThan(expression1, expression2) : XCTAssertLessThan(expression1, expression2, message)
        case .lessThanOrEqual:
            message.isEmpty ? XCTAssertLessThanOrEqual(expression1, expression2) : XCTAssertLessThanOrEqual(expression1, expression2, message)
        case .greaterThanOrEqual:
            message.isEmpty ? XCTAssertGreaterThanOrEqual(expression1, expression2) : XCTAssertGreaterThanOrEqual(expression1, expression2, message)
        default:
            XCTFail("Assert type is not supported")
        }
        return self
    }
    
    @discardableResult
    public func assert(assertType: _XCTAssertionType, expression: Bool, message: String = "") -> Self {
        switch assertType {
        case .true:
            message.isEmpty ? XCTAssertTrue(expression) : XCTAssertTrue(expression, message)
        case .false:
            message.isEmpty ? XCTAssertFalse(expression) : XCTAssertFalse(expression, message)
        default:
            XCTFail("Assert type is not supported")
        }
        return self
    }
}
