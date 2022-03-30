//
//  UIImageView.swift
//  ios-sunmobile
//
//  Created by Jeff DeWitte on 3/4/22.
//

import SDWebImage
import UIKit

public extension UIImageView {
    public func loadImage(stringURL: String) {
        sd_setImage(with: URL(string: stringURL), placeholderImage: #imageLiteral(resourceName: "Placeholder-image"))
    }
    
    public func setActivityIndicator() {
        sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
    }
    
    public func loadImage(data: Data) {
            self.image = UIImage(data: data)
    }
}
