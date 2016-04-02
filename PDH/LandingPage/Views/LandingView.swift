//
//  LandingView.swift
//  PDH
//
//  Created by Ellan Jesse on 11/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class LandingView: PDHView {

    @IBOutlet internal weak var fbLoginButton: FBSDKLoginButton!
    @IBOutlet internal weak var loginLabel: UILabel!
    @IBOutlet internal weak var horizontalLine: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        fbLoginButton = FBSDKLoginButton()
    }

//    override func layoutSubviews() {
//        let loginLabelBottom =
//            (loginLabel.frame.origin.y + loginLabel.frame.size.height)
//        let horizontalLineTop = horizontalLine.frame.origin.y
//        let distance = (horizontalLineTop - loginLabelBottom)
//        fbLoginButton.removeFromSuperview()
//        fbLoginButton.center.y = loginLabelBottom + distance
//        fbLoginButton.center.x = self.center.x
//        self.addSubview(fbLoginButton)
//    }

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