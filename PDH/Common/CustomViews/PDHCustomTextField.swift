//
//  PDHCustomLabel.swift
//  PDH
//
//  Created by Ellan Jesse on 4/5/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHCustomTextField: UITextField {

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x + 5, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
    }

    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return self.textRectForBounds(bounds);
    }
}