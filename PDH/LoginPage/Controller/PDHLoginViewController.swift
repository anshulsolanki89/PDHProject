//
//  PDHLoginViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHLoginViewController: UIViewController {
    let loginDataManager = PDHLoginDataManager()

    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! PDHLoginView).delegate = self
    }
}

extension PDHLoginViewController: ViewActionDelegate {
    func viewPerformedAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        case .Login:
            PDHLoginDataManager.loginWithData(data!)
        default:
            fatalError("Error")
        }
    }
}