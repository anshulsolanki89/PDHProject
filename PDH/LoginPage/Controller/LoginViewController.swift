//
//  LoginViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! LoginView).delegate = self
    }
}

extension LoginViewController: ViewActionDelegate {
    func viewPerformedAction(action: ViewActions) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        default:
            fatalError("Error")
        }
    }
}