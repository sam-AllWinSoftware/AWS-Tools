import XCTest
import UITestUtilitiesApp

public extension XCUIApplication {
    
    func swipe(to element: XCUIElement) {
        var elementRelativeLocation = frame.midY.distance(to: element.frame.midY)
        var distanceToCenter = elementRelativeLocation.magnitude
        var velocity = XCUIGestureVelocity(distanceToCenter > frame.height ? distanceToCenter : frame.height / 4)
        
        while distanceToCenter > frame.height / 4 {
            elementRelativeLocation > 0 ? swipeUp(velocity: velocity) : swipeDown(velocity: velocity)
            
            elementRelativeLocation = frame.midY.distance(to: element.frame.midY)
            
            // Check if the element has not moved after the swipe
            if distanceToCenter == elementRelativeLocation.magnitude {
                break
            }
            
            distanceToCenter = elementRelativeLocation.magnitude
            velocity = XCUIGestureVelocity(distanceToCenter > frame.height ? distanceToCenter : frame.height / 4)
        }
        
        if !element.isHittable {
            XCTFail("Item cannot be accessed by swiping")
        }
    }

    func scrollToLastCell(collectionView: XCUIElement) {
        var refId = ""
        while refId != collectionView.cells.element(boundBy: 0).identifier {
            let cell = collectionView.cells.element(boundBy: 0).isHittable ? collectionView.cells.element(boundBy: 0) : collectionView.cells.element(boundBy: 1)
            refId = collectionView.cells.element(boundBy: 0).identifier
            cell.swipeLeft(velocity: XCUIGestureVelocity.slow)
        }
    }
    
    func scrollToFirstCell(collectionView: XCUIElement) {
        var refId = ""
        while refId != collectionView.cells.element(boundBy: 0).identifier {
            let cell = collectionView.cells.element(boundBy: 0).isHittable ? collectionView.cells.element(boundBy: 0) : collectionView.cells.element(boundBy: 1)
            refId = cell.identifier
            cell.swipeRight(velocity: XCUIGestureVelocity.slow)
        }
    }

    func findCellById(collectionView: XCUIElement, cell: UIAccessibilityId) {
        let cellType = XCUIElement.ElementType(rawValue: cell.elementType.rawValue) ?? .cell
        findCellById(collectionView: collectionView, cellId: cell.accessibilityIdentifier, cellType: cellType)
    }
    
    func findCellById(collectionView: XCUIElement, cellId: String, cellType: XCUIElement.ElementType = .cell) {
        let cellsQuery = collectionView.descendants(matching: cellType)
        
        let cellQuery = cellsQuery.element(matching: cellType, identifier: cellId)
        var lastCellId = cellsQuery.allElementsBoundByIndex.last?.identifier
        
        while !cellQuery.exists || !cellQuery.isHittable {
            collectionView.swipeLeft(velocity: .slow)
            let newLastCellId = cellsQuery.allElementsBoundByIndex.last?.identifier
            
            // Check if the element has not moved after the swipe
            if lastCellId == newLastCellId {
                break
            } else {
                lastCellId = newLastCellId
            }
        }
        
        if !cellQuery.isHittable {
            XCTFail("Item cannot be accessed by swiping")
        }
    }
    
    func getCellsIds(collectionView: XCUIElement) -> [String] {
        var refId = ""
        var arrayIds = [String]()
        while refId != collectionView.cells.element(boundBy: 0).identifier {
            for cell in collectionView.cells.allElementsBoundByIndex {
                if !arrayIds.contains(cell.identifier) { arrayIds.append(cell.identifier) }
            }
            let cell = collectionView.cells.element(boundBy: 0).isHittable ? collectionView.cells.element(boundBy: 0) : collectionView.cells.element(boundBy: 1)
            refId = collectionView.cells.element(boundBy: 0).identifier
            cell.swipeLeft(velocity: XCUIGestureVelocity.slow)
        }
        return arrayIds
    }

    enum ScrollDirection {
        case up(CGFloat)
        case down(CGFloat)
        case left(CGFloat)
        case right(CGFloat)
        var vector: CGVector {
            switch self {
            case .down(let offset): return CGVector(dx: 0.0, dy: -offset)
            case .up(let offset): return CGVector(dx: 0.0, dy: offset)
            case .left(let offset): return CGVector(dx: offset, dy: 0.0)
            case .right(let offset): return CGVector(dx: -offset, dy: 0.0)
            }
        }
    }
    
    func swipeByCoordinate(refElement: XCUIElement, duration: TimeInterval, startdelxy: CGVector, enddeltaxy: CGVector) {
        let swipeStartPoint = refElement.coordinate(withNormalizedOffset: startdelxy)
        let swipeEndPoint = refElement.coordinate(withNormalizedOffset: enddeltaxy)
        swipeStartPoint.press(forDuration: duration, thenDragTo: swipeEndPoint)
    }
    
}
