//
//  PDHButton.swift
//  TestContainer
//
//  Created by Ellan Jesse on 12/5/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import UIKit

@IBDesignable
class PDHButton: UIButton {

    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var cornerRadius: CGFloat = 4.0
    @IBInspectable var boderColor: UIColor = UIColor.rgb(121, g: 207, b: 63, α: 1)
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.borderColor = boderColor.CGColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
}
