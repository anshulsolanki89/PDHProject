//
//  PDHHelper.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import UIKit

class PDHHelper {
    class func imageNamed(image: String) -> UIImage {
        let backArrowImage =
            UIImage(named:image + ".imageset",
                inBundle: NSBundle(forClass:self),
                compatibleWithTraitCollection: nil)!
        
        return backArrowImage
    }
    
    class func whiteBackBtn(btn: UIButton) -> UIButton {
        btn.setImage(self.imageNamed("Back_Arrow").renderedImage(),
            forState: .Normal)
        btn.tintColor = UIColor.whiteColor()
        
        return btn
    }

    class func getSkiaRegularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Skia-Regular", size: size)!
    }
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat, α: CGFloat) -> UIColor{
        return UIColor(
            red: (r / 255.0),
            green: (g / 255.0),
            blue: (b / 255.0),
            alpha: α)
    }
    
    class func getCancelBtnColor() -> UIColor {
        return rgb(55, g: 44, b: 16, α: 1)
    }
}