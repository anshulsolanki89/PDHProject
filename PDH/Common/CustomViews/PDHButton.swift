//
//  PDHButton.swift
//  TestContainer
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import UIKit

@IBDesignable
class PDHButton: UIButton {

    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var cornerRadius: CGFloat = 4.0
    @IBInspectable var boderColor: UIColor = UIColor(
        red: (121.0 / 255.0),
        green:(207.0 / 255.0),
        blue: (63.0 / 255.0),
        alpha: 1.0)
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.borderColor = boderColor.CGColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
}
