//
//  PDHRegistrationView.swift
//  PDH
//
//  Created by Ellan Jesse on 11/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHRegistrationView: PDHView {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var selectedImageView: UIImageView!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registrationViewCentreConstraint: NSLayoutConstraint!

    private var currentTextField: UITextField!
    
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
        adjustingHeight(notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        resetViewPotision()
    }
    
    
    func adjustingHeight(notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let currentTextFieldFrame = self.convertRect(currentTextField.frame, fromView: contentView)
        var contentHeight: CGFloat = 0
        if (currentTextFieldFrame.origin.y + currentTextFieldFrame.size.height)
            > (self.frame.size.height - keyboardFrame.size.height - 10 ) {
            contentHeight = (currentTextFieldFrame.origin.y + currentTextFieldFrame.size.height)
                - (self.frame.size.height - keyboardFrame.size.height - 10)
        }
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.registrationViewCentreConstraint.constant -= contentHeight
        })
        
    }
    
    func resetViewPotision() {
        registrationViewCentreConstraint.constant = 0
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
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        currentTextField = textField
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}