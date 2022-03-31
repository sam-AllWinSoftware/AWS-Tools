//
//  UIAlertController+Builder.swift
//  ios-sunmobile
//
//  Created by Aylwing Olivas on 8/9/21.
//

import UIKit

public extension UIAlertController {

     final class Builder {

        public var title: String?
        public var message: String?
        public var actions: [UIAlertAction] = []
        public var alertStyle: UIAlertController.Style = .alert
        public var presentationStyle: UIModalPresentationStyle = .automatic
        public var allowedArrowDirection: UIPopoverArrowDirection = .any
        public var sourceView: UIView?
        public var sourceRect: CGRect?
        public var showTextField = false
        
        public var textFields: [UITextField]?

        @discardableResult func withTitle(_ title: String?) -> Builder {
            self.title = title
            return self
        }

        @discardableResult func withMessage(_ message: String?) -> Builder {
            self.message = message
            return self
        }

        @discardableResult func withButton(style: UIAlertAction.Style = .default,
                                           title: String,
                                           callback: ((Builder) -> Void)? = nil) -> Builder {

            let cancelAction = UIAlertAction(title: title,
                                             style: style,
                                             handler: { _ in callback?(self) })

            actions.append(cancelAction)
            return self
        }

        @discardableResult func withAlertStyle(_ style: UIAlertController.Style) -> Builder {
            self.alertStyle = style
            return self
        }

        @discardableResult func withPresentationStyle(_ style: UIModalPresentationStyle) -> Builder {
            self.presentationStyle = style
            return self
        }

        @discardableResult func withAllowedArrowDirection(_ direction: UIPopoverArrowDirection) -> Builder {
            self.allowedArrowDirection = direction
            return self
        }

        @discardableResult func withSourceView(_ sourceView: UIView?) -> Builder {
            self.sourceView = sourceView
            return self
        }

        @discardableResult func withSourceRect(_ sourceRect: CGRect?) -> Builder {
            self.sourceRect = sourceRect
            return self
        }
        
        @discardableResult func withTextField(_ showTextField: Bool) -> Builder {
            self.showTextField = showTextField
            return self
        }

        public func present(in viewController: UIViewController?) {
            guard let viewController = viewController, viewController.isViewLoaded, viewController.view.window != nil else { return }
            let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: self.alertStyle)
            alert.modalPresentationStyle = presentationStyle
            alert.popoverPresentationController?.permittedArrowDirections = allowedArrowDirection

            if let sourceView = sourceView, let sourceRect = sourceRect {
                alert.popoverPresentationController?.sourceView = sourceView
                alert.popoverPresentationController?.sourceRect = sourceRect
            }

            if showTextField {
                alert.addTextField()
                self.textFields = alert.textFields
            }
            
            self.actions.forEach { alert.addAction($0) }
            DispatchQueue.main.async { viewController.present(alert, animated: true) }
        }
    }
}

public var topViewController: UIViewController? {

    if var topViewController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController {
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }

    return nil
}
