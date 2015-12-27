//
//  PDHLoginView.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHLoginView: PDHView {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var anshul = 10
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
   
    @IBAction func loginBtnClicked(sender: AnyObject) {
        if !isFormFieldError() {
            delegate?.viewDidPerformAction(ViewActions.FormFieldError, data: nil)
            return
        }
        
        let dataDict = [
            "username": userNameTextField.text!,
            "password": passwordTextField.text!
            ]
        
        delegate?.viewDidPerformAction(ViewActions.Login, data: dataDict)
    }

    private func isFormFieldError() -> Bool {
        if userNameTextField.text! == "" {
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

extension PDHLoginView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}