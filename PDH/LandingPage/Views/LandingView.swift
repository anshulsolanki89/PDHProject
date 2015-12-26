//
//  LandingView.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class LandingView: PDHView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    @IBAction func registerBtnClicked(sender: AnyObject) {
        delegate?.viewPerformedAction(ViewActions.Register, data: nil)
    }
 
    @IBAction func loginBtnClicked(sender: AnyObject) {
        delegate?.viewPerformedAction(ViewActions.Login, data: nil)
    }
}