//
//  PDHCustomCircleLabel.swift
//  PDH
//
//  Created by Anshul Solanki on 12/23/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PDHCustomCircleLabel: UILabel {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.cornerRadius = (self.frame.size.height / 2)
        self.textAlignment = .Center
    }
}