//
//  PDHNewAddressViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 4/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHNewAddressViewController: PDHViewController {
    private var addressDataManager: PDHAddressDataManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHNewAddresView).userID = PDHDataManager.getUserData()!.email
        (self.view as! PDHNewAddresView).delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    deinit {
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Private
extension PDHNewAddressViewController {
    private func initializeDataManager() {
        if nil == addressDataManager {
            addressDataManager = PDHAddressDataManager()
            addressDataManager.delegate = self
        }
    }

    private func addNewAddress(data: [String: AnyObject]) {
        initializeDataManager()
        PDHProgressIndicator.showLoadingIndicator(self.view)
        addressDataManager.addNewUserAddress(data)
    }
}

// MARK:- View Action Delegate
extension PDHNewAddressViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            self.navigationController!.popViewControllerAnimated(true)
        case .FormFieldError:
            showFormFieldError()
        case .SaveAddress:
            addNewAddress(data!)
        default:
            break
        }
    }
}

// MARK:- PDHDataManager Delegate
extension PDHNewAddressViewController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        let successAlert = UIAlertController(
            title: "PDH",
            message: "Address added successfully",
            preferredStyle: UIAlertControllerStyle.Alert)

        let OKAction = UIAlertAction(title: "OK", style: .Default) { [weak self] (alertAction) -> Void in
            (self?.view as? PDHNewAddresView)?.addressAddedSuccessFully()
        }

        successAlert.addAction(OKAction)

        self.presentViewController(successAlert, animated: true, completion: nil)
    }
}