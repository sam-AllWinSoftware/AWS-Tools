import UIKit
import SwiftUI

public enum ThemeFactory {
    
    public static func font(_ sunFont: SunFont) -> UIFont? {
        return sunFont.font
    }

    public static func color(_ themeColor: SunColor) -> UIColor? {
        return themeColor.color
    }
    
    public static func color(_ themeColor: SunColor) -> CGColor? {
        return color(themeColor)?.cgColor
    }
}
