//
//  RegistrationController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class RegistrationController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! RegistrationView).delegate = self
    }
}

extension RegistrationController: ViewActionDelegate {
    func viewPerformedAction(action: ViewActions) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        default:
            fatalError("Error")
        }
    }
}