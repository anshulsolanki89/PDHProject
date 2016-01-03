//
//  PDHOrderConfirmationView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/15/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHOrderConfirmationView: PDHView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }
}