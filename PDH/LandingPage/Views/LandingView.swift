//
//  LandingView.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class LandingView: PDHView {

    @IBOutlet internal weak var fbLoginButton: FBSDKLoginButton!

    override func awakeFromNib() {
        super.awakeFromNib()
//        fbLoginButton = FBSDKLoginButton()
    }
 
    @IBAction func registerBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Register, data: nil)
    }
 
    @IBAction func loginBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Login, data: nil)
    }

    @IBAction func fbLoginBtnCLicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.FBLogin, data: nil)
    }

}