//
//  UIViewController+ErrorAlertPresenter.swift
//  ios-sunmobile
//
//  Created by Aylwing Olivas on 11/18/21.
//

import UIKit

public extension UIViewController {
     func presentAlert(with error: Error) {
        let viewError: ViewError = error as? ViewError ?? APIError.genericError
        UIAlertController
            .Builder()
            .withTitle(viewError.title)
            .withMessage(viewError.localizedDescription)
            .withButton(title: "OK")
            .present(in: self)
    }
}
