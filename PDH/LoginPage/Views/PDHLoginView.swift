//
//  PDHLoginView.swift
//  PDH
//
//  Created by Ellan Jesse on 11/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHLoginView: PDHView {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        addNotificationObserver()
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

    func keyboardWillShow(notification:NSNotification) {
        
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
        })
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.endEditing(true)
    }
    
    deinit {
        print("\(self) -> deallocated")
        removeNotificationObserver()
    }
}

// MARK:- Private
extension PDHLoginView {
    private func addNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification, object: nil)
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

    private func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
}

extension PDHLoginView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}