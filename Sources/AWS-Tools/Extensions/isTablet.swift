//
//  isTablet.swift
//  ios-sunmobile
//

import UIKit

public var isTablet: Bool {
    UIDevice.current.userInterfaceIdiom == .pad
}
