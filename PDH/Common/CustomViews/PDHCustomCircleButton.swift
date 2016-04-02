//
//  PDHCustomCircleButton.swift
//  PDH
//
//  Created by Ellan Jesse on 12/7/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
public class PDHCustomCircleButton: UIButton {
    
    @IBInspectable public var borderWidth: CGFloat = 0
        @IBInspectable public var layerColor: UIColor = UIColor.blackColor()
    
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.cornerRadius = (self.frame.size.width / 2)
        self.layer.borderColor = layerColor.CGColor
        self.layer.borderWidth = borderWidth
    }
}