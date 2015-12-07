//
//  PDHCustomCurveView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/7/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PDHCustomCurveView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
   
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
  
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.CGColor
        }
    }
}