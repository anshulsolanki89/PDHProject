//
//  PDHNewAddresView.swift
//  PDH
//
//  Created by Anshul Solanki on 4/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHNewAddresView: PDHView {

    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var address1: UITextField!
    @IBOutlet private weak var address2: UITextField!

    @IBOutlet private weak var pincode: UITextField!

    @IBOutlet private weak var locality: UITextField!
    @IBOutlet private weak var mobile: UITextField!

    var userID: String!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func backButtonAction(sender: UIButton) {
        self.delegate?.viewDidPerformAction(.Back, data: nil)
    }

    @IBAction func saveBtnAction(sender: AnyObject) {
        if isFormFieldError() {
            delegate?.viewDidPerformAction(.FormFieldError, data: nil)
            return
        }

        delegate?.viewDidPerformAction(.SaveAddress, data: getNewAddressDataObject())
    }

    func addressAddedSuccessFully() {
        name.text = ""
        address1.text = ""
        address2.text = ""
        locality.text = ""
        pincode.text = ""
        mobile.text = ""
    }
    
    deinit {
        removeNotificationObserver()
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Private 
extension PDHNewAddresView {

    private func isFormFieldError() -> Bool {
        if name.text! == "" {
            return true
        }
        if address1.text! == "" {
            return true
        }
        if pincode.text! == "" {
            return true
        }
        if locality.text! == "" {
            return true
        }

        return false

    }

    private func getNewAddressDataObject() -> [String: String!] {
        let newUserAddress = [
            "uid" : userID,
            "name" : name.text!,
            "address" : address1.text! + " " + address2.text!,
            "locality" : locality.text!,
            "pincode" : pincode.text!,
            "mobile" : mobile.text!
        ]

        return newUserAddress
    }

    private func addNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification, object: nil)
    }

    private func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillHideNotification,
            object: nil)
    }

}

// MARK:- TextField Delegate
extension PDHNewAddresView: UITextFieldDelegate {

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}