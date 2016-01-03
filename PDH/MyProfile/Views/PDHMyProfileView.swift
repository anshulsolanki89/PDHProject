//
//  PDHMyProfileView.swift
//  PDH
//
//  Created by Anshul Solanki on 1/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
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