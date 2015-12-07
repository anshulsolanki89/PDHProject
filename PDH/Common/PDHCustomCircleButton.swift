//
//  PDHCustomCircleButton.swift
//  PDH
//
//  Created by Anshul Solanki on 12/7/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PDHCustomCircleButton: UIButton {
    
    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = (self.frame.size.width / 2)
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowColor = UIColor.whiteColor().CGColor
        self.layer.shadowRadius = 2.0
        self.layer.backgroundColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.0
    }
}