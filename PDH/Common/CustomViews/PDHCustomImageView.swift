//
//  PDHCustomImageView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/20/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PDHCustomImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 6 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
    }
}