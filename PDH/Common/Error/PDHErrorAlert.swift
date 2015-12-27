//
//  PDHErrorAlert.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHErrorAlert {
    
    class func showErrorAlert(message: String) -> UIAlertController {
        let errorAlert = UIAlertController(
            title: "PDH",
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (alertAction) -> Void in
            
        }
        
        errorAlert.addAction(OKAction)
        
        return errorAlert
    }
}