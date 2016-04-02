//
//  PDHCustomCircleLabel.swift
//  PDH
//
//  Created by Ellan Jesse on 12/23/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
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