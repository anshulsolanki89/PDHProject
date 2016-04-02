//
//  PDHMyProfileView.swift
//  PDH
//
//  Created by Ellan Jesse on 1/3/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMyProfileView: PDHView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func backBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Back, data: nil)
    }
}