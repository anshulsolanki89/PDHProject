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
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
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

    @IBAction func cameraBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Camera, data: nil)
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
    
    func setImage(selectedImage: UIImage) {
        selectedImageView.contentMode = UIViewContentMode.ScaleAspectFill
        selectedImageView.image = selectedImage
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
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

    deinit {
        print("\(self) -> deallocated")
        removeNotificationObserver()
    }
}

// MARK:- Private
extension PDHRegistrationView {
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

    private func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
}

extension PDHRegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}