//
//  LandingViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 11/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        print("asdasdas")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! LandingView).delegate = self
    }

    func performFacebookLogin() {
        (self.view as! LandingView).fbLoginButton.readPermissions = ["email", "public_profile"]
        if FBSDKAccessToken.currentAccessToken().hasGranted("email") && FBSDKAccessToken.currentAccessToken().hasGranted("public_profile") {

        }
    }

    func askFacebookPermmissions() {
        
    }
}

extension LandingViewController: FBSDKLoginButtonDelegate {
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {

    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }

    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        if FBSDKAccessToken.currentAccessToken().hasGranted("email") && FBSDKAccessToken.currentAccessToken().hasGranted("public_profile") {
            
        }

        return true
    }
}

extension LandingViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Login:
            print("\(self) -> Login")
            self.performSegueWithIdentifier("pdhLogin", sender: nil)
        case .Register:
            print("\(self) -> Register")
            self.performSegueWithIdentifier("pdhRegister", sender: nil)
        case .FBLogin:
            debugPrint("\(self) -> FBLogin")
        default:
            fatalError("Error")
        }
    }
}