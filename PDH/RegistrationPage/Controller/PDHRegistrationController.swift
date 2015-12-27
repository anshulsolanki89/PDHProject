//
//  PDHRegistrationController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHRegistrationController: PDHViewController {
    var registrationDataManager: PDHRegistrationDataManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! PDHRegistrationView).delegate = self
    }
    
    private func registration(data: [String: AnyObject]) {
        PDHProgressIndicator.showLoadingIndicator(self.view)
        registrationDataManager.registerWithData(data)
    }
    
    private func initaializeDataManager() {
        registrationDataManager = PDHRegistrationDataManager()
        registrationDataManager.delegate = self
    }
    
    private func performRegistration(data: [String: AnyObject]) {
        initaializeDataManager()
        registration(data)
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

// MARK:- ViewAction Delegate
extension PDHRegistrationController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        case .FormFieldError:
            showFormFieldError()
        case .Register:
            performRegistration(data!)
        default:
            fatalError("Error")
        }
    }
}

// MARK:- DataManager Protocol
extension PDHRegistrationController {
   
    override func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? PDHLoginInfoDataObject {
            registrationDataManager.saveUserData(response)
            self.performSegueWithIdentifier("menuScreen", sender: nil)
        }
    }
    
}