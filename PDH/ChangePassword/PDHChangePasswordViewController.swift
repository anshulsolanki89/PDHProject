//
//  PDHChangePasswordViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 5/15/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHChangePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitBtnClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension PDHChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}