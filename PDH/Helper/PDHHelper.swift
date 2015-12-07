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

}