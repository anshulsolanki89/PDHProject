//
//  PDHViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import UIKit

class PDHViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func showErrorAlert(message: String) {
        let alert = PDHErrorAlert.showErrorAlert(message)
        self.presentViewController(alert, animated: true) { () -> Void in
        }
    }

    func showFormFieldError() {
        showErrorAlert("Please check the data entered by you, text field cannot be empty.")
    }
}

// MARK:- DataManager Protocol
extension PDHViewController: PDHDataManagerProtocol {    
    func didReceiveDataWithError(response: AnyObject?) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? PDHErrorObject {
            showErrorAlert(response.errorMessage)
        } else {
            showErrorAlert("Something wrong happened, Please try after some time.")
        }
    }
    
    func didFailWithError(error: String) {
        PDHProgressIndicator.hideLoadingIndicator()
        showErrorAlert(error)
    }
}