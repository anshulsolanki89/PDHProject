//
//  PDHRegistrationView.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHRegistrationView: PDHView {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        changeBackBtnImage()
    }
    
    private func changeBackBtnImage() {
        backBtn = PDHHelper.whiteBackBtn(backBtn)
    }
    
    @IBAction func backBtnAction(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Back, data: nil)
    }

    @IBAction func registerBtnClicked(sender: AnyObject) {
        if !isFormFieldError() {
            delegate?.viewDidPerformAction(ViewActions.FormFieldError, data: nil)
            return
        }
        let data = [
            "name": nameTextField.text!,
            "email": emailtextField.text!,
            "mobile": mobileNumberTextField.text!,
            "password": passwordTextField.text!
        ]
        
        delegate?.viewDidPerformAction(ViewActions.Register, data: data)
    }
    
    private func isFormFieldError() -> Bool {
        // TODO:- Individual Textfield case check, in future handle each 
        // text field error.
        if nameTextField.text! == "" {
            return false
        }
        if emailtextField.text! == "" {
            return false
        }
        if mobileNumberTextField.text! == "" {
            return false
        }
        if passwordTextField.text! == "" {
            return false
        }
        
        return true
    }

    deinit {
        print("\(self) -> deallocated")
    }
}

extension PDHRegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}