//
//  PDHLoginViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class PDHLoginViewController: PDHViewController {
    var loginDataManager: PDHLoginDataManager!

    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! PDHLoginView).delegate = self
    }
    
    
    private func login(data: [String: AnyObject]) {
        PDHProgressIndicator.showLoadingIndicator(self.view)
        loginDataManager.loginWithData(data)
    }
    
    private func initaializeDataManager() {
        loginDataManager = PDHLoginDataManager()
        loginDataManager.delegate = self
    }
    
    private func performLogin(data: [String: AnyObject]) {
        initaializeDataManager()
        login(data)
    }
}

// MARK:- ViewAction Delegate
extension PDHLoginViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        case .Login:
            performLogin(data!)
        case .FormFieldError:
            showFormFieldError()
        default:
            fatalError("Error, casenot handled")
        }
    }
}

// MARK:- DataManager Protocol
extension PDHLoginViewController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? PDHLoginInfoDataObject {
            PDHLoginDataManager.saveUserData(response)
            self.performSegueWithIdentifier("menuScreen", sender: nil)
        }
    }
    
}