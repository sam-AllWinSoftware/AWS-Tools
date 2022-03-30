//
//  isPhone.swift
//  ios-sunmobile

import UIKit

public var isPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
}
