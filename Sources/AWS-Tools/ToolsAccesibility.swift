//
//  File.swift
//  
//
//  Created by User on 3/31/22.
//

import Foundation
import UIKit

enum SunFont {
   
  // MARK: SUN COLORS
  case primaryLabel
  case primaryTextField
  case primaryTextView
  // MARK: Container
  case topContainerLabelTitle
  case pageCounterLabel
  case fieldContainerLabel
  // MARK: NAVIGATION
  case navigationItemLabel
  case sectionHeaderLabel
  // MARK: SEARCHBAR
  case searchBarButtonText
  // MARK: Elements
  case loginLabelTitle
  case loginWelcomeTitle
  case loginPrimaryButtonText
  case loginSecondaryButtonText
  case passwordResetLabelTitle
  case passwordResetButtonText
  case userProfileTextField
  case userProfileButtonText

  var font: UIFont? {
     
    switch self {
    case .primaryLabel: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 17.0, maxSize: isTablet ? 28 : 26)
    case .primaryTextField: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 14.0, maxSize: isTablet ? 35 : 23)
    case .primaryTextView: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 14.0, maxSize: isTablet ? 35 : 23)
    case .topContainerLabelTitle: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 25.0, maxSize: isTablet ? 58 : 34)
    case .loginLabelTitle:  return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 25.0, maxSize: isTablet ? 50 : 34)
    case .loginWelcomeTitle: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 29.0, maxSize: isTablet ? 65 : 36)
    case .loginPrimaryButtonText: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 15.0, maxSize: isTablet ? 54 : 24)
    case .loginSecondaryButtonText: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 18.0, maxSize: isTablet ? 40 : 25)
    case .passwordResetLabelTitle: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 25.0, maxSize: isTablet ? 58 : 34)
    case .passwordResetButtonText: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 15.0, maxSize: isTablet ? 54 : 24)
    case .userProfileTextField: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 20.0, maxSize: isTablet ? 57 : 29)
    case .userProfileButtonText: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 15.0, maxSize: isTablet ? 54 : 24)
    case .navigationItemLabel: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 17.0, maxSize: isTablet ? 55 : 26)
    case .searchBarButtonText: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 15.0, maxSize: isTablet ? 54 : 24)
    case .pageCounterLabel: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 25.0, maxSize: isTablet ? 58 : 34)
    case .fieldContainerLabel: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 15.0, maxSize: isTablet ? 28 : 24)
    case .sectionHeaderLabel: return UIFont.scaledFont(textStyle: "HelveticaNeue", defaultSize: 28.0, maxSize: isTablet ? 61 : 37)
    }
  }
}

private extension UIFont {
  static func scaledFont(textStyle: String, defaultSize: CGFloat, maxSize: CGFloat? = nil) -> UIFont? {
    guard let font = UIFont(name: textStyle, size: defaultSize) else { return nil }
    return UIFontMetrics.default.scaledFont(for: font, maximumPointSize: maxSize ?? defaultSize)
  }
}

enum SunColor {
  // MARK: SUN COLORS
  case sunBlue
  case sunOrange
  case sunWhite
  // MARK: VIEW BACKGROUND
  case viewBackgroundPrimary
  case viewBackgroundSecondary
  case viewBackgroundTertiary
  case viewBackgroundGray
  // MARK: TopContainer
  case homeTopContainer
  case homeContainerTopLine
  // MARK: NAVIGATION
  case navigationLabelPrimary
  // MARK: BUTTONS ELEMENTS
  case buttonTextColorPrimary
  case buttonTintPrimary
  case buttonTintSecondary
  case buttonTintStatusPrimary
  // MARK: CELL ELEMENTS
  case cellTextColorPrimary
  case cellTextColorSecondary
  case cellTextColorTertiary
  // MARK: CONTAINER ELEMENTS
  case containerLabelPrimary
  case containerLabelSecondary
  case containerTintPrimary
  // MARK: SEARCHBAR
  case searchTextFieldTint
  case shadowTintPrimary
  // MARK: PAGE INDICATOR
  case currentPageIndicatorTintColor
  case pageIndicatorTintColor
    
  var color: UIColor? {
    switch self {
    case .sunBlue:             return UIColor(named: "sunBlue")
    case .sunOrange:            return UIColor(named: "sunOrange")
    case .sunWhite:             return UIColor(named: "sunWhite")
    case .viewBackgroundPrimary:      return UIColor.systemBackground
    case .viewBackgroundSecondary:     return UIColor.secondarySystemBackground
    case .viewBackgroundTertiary:      return UIColor.tertiarySystemBackground
    case .shadowTintPrimary:        return UIColor(named: "shadowTintPrimary")
    case .viewBackgroundGray:        return UIColor(named: "sunBackgroundGray")
    case .homeTopContainer:         return UIColor(named: "homeTopContainer")
    case .homeContainerTopLine:       return UIColor(named: "homeTopLine")
    case .navigationLabelPrimary:      return UIColor(named: "navigationLabelPrimary")
    case .buttonTextColorPrimary:      return UIColor(named: "buttonTextColorPrimary")
    case .buttonTintPrimary:        return UIColor(named: "buttonTintPrimary")
    case .buttonTintSecondary:       return UIColor(named: "buttonTintSecondary")
    case .buttonTintStatusPrimary:     return UIColor(named: "buttonTintStatusPrimary")
    case .cellTextColorPrimary:       return UIColor(named: "cellTextColorPrimary")
    case .cellTextColorSecondary:      return UIColor(named: "cellTextColorSecondary")
    case .cellTextColorTertiary:      return UIColor(named: "cellTextColorTertiary")
    case .containerLabelPrimary:      return UIColor(named: "containerLabelPrimary")
    case .containerLabelSecondary:     return UIColor(named: "containerLabelSecondary")
    case .containerTintPrimary:       return UIColor(named: "containerTintPrimary")
    case .searchTextFieldTint:       return UIColor(named: "searchTextFieldTint")
    case .currentPageIndicatorTintColor:  return UIColor(named: "currentPageIndicatorTintColor")
    case .pageIndicatorTintColor:      return UIColor(named: "pageIndicatorTintColor")
    }
  }
}
