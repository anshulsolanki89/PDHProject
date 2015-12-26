//
//  LandingViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! LandingView).delegate = self
    }
    
}

extension LandingViewController: ViewActionDelegate {
    func viewPerformedAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Login:
            print("\(self) -> Login")
            self.performSegueWithIdentifier("pdhLogin", sender: nil)
        case .Register:
            print("\(self) -> Register")
            self.performSegueWithIdentifier("pdhRegister", sender: nil)
        default:
            fatalError("Error")
        }
    }
}