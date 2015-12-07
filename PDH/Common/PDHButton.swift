//
//  PDHButton.swift
//  TestContainer
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import UIKit

class PDHButton: UIButton {
    
    override func drawRect(rect: CGRect) {
        self.layer.borderColor = UIColor(red: (255.0 / 255.0), green:
            (187.0 / 255.0),
            blue: 0,
            alpha: 1.0).CGColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4.0
    }
}
