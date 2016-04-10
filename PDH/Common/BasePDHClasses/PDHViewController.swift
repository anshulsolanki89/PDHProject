//
//  PDHViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import UIKit

class PDHViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func showAlert(message: String) {
        let alert = PDHErrorAlert.showErrorAlert(message)
            self.presentViewController(alert, animated: true) { () -> Void in
        }
    }

    func showFormFieldError() {
        showAlert("Please check the data entered by you, text field cannot be empty.")
    }
}

// MARK:- DataManager Protocol
extension PDHViewController: PDHDataManagerProtocol {    
    func didReceiveDataWithError(response: AnyObject?) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? PDHErrorObject {
            showAlert(response.errorMessage)
        } else {
            showAlert("Something wrong happened, Please try after some time.")
        }
    }
    
    func didFailWithError(error: String) {
        PDHProgressIndicator.hideLoadingIndicator()
        showAlert(error)
    }
}