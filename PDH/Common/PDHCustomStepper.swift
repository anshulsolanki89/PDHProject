//
//  PDHCustomStepper.swift
//  PDH
//
//  Created by Anshul Solanki on 12/8/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PDHCustomStepper: UIView {

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let stepperView = UINib(
            nibName: "PDHCustomStepper",
            bundle: NSBundle.mainBundle()
            ).instantiateWithOwner(nil, options: nil)[0] as! UIView
        
        self.addSubview(stepperView)
    }
    
}