//
//  UIActivityViewController+Builder.swift
//  ios-sunmobile
//
//  Created by Aylwing Olivas on 10/14/21.
//

import UIKit

public extension UIActivityViewController {

    public final class Builder {

        public var items: [Any] = []
        public var sourceRect: CGRect?
        public var sourceView: UIView?
        public var activities: [UIActivity]?
        public var direction: UIPopoverArrowDirection?

        @discardableResult func withItems(_ items: [Any]) -> Builder {
            self.items = items
            return self
        }
        
        @discardableResult func withActivities(_ activities: [UIActivity]) -> Builder {
            self.activities = activities
            return self
        }
        
        @discardableResult func withSourceRect(_ sourcerect: CGRect) -> Builder {
            self.sourceRect = sourcerect
            return self
        }
        
        @discardableResult func withSourceView(_ sourceView: UIView) -> Builder {
            self.sourceView = sourceView
            return self
        }
        
        @discardableResult func withDirection(_ direction: UIPopoverArrowDirection) -> Builder {
            self.direction = direction
            return self
        }

        public func present(in viewController: UIViewController, _ completionHandler: UIActivityViewController.CompletionWithItemsHandler? = nil) {
            guard viewController.isViewLoaded, viewController.view.window != nil else { return }
            let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: activities)
            
            if let popoverController = activityViewController.popoverPresentationController {
                popoverController.sourceRect = sourceRect ?? .zero
                popoverController.sourceView = sourceView
                popoverController.permittedArrowDirections = direction ?? .any
            }
            activityViewController.completionWithItemsHandler = completionHandler
            
            DispatchQueue.main.async {
                viewController.present(activityViewController, animated: true)
            }
        }
    }
}
