//
//  PDHMyProfileView.swift
//  PDH
//
//  Created by Ellan Jesse on 1/3/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMyProfileView: PDHView {

    private var currentTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        addNotificationObserver()
    }
    
    @IBAction func backBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Back, data: nil)
    }

    @IBAction func changePasswordClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.ChangePassword, data: nil)
    }

    deinit {
        print("\(self) DEALLOCATED")
        removeNotificationObserver()
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
        let currentTextFieldFrame = self.convertRect(currentTextField.frame, fromView: currentTextField.superview!)
        var contentHeight: CGFloat = 0
        if (currentTextFieldFrame.origin.y + currentTextFieldFrame.size.height)
            > (self.frame.size.height - keyboardFrame.size.height - 10 ) {
                contentHeight = (currentTextFieldFrame.origin.y + currentTextFieldFrame.size.height)
                    - (self.frame.size.height - keyboardFrame.size.height - 10)
        }

        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.frame.origin.y = 0
            self.frame.origin.y -= contentHeight
        })

    }

    func resetViewPotision() {
        self.frame.origin.y = 0
    }

}

// MARK:- Private
extension PDHMyProfileView {
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

extension PDHMyProfileView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        currentTextField = textField
        return true
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
