//
//  PDHProgressIndicator.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import MBProgressHUD

class PDHProgressIndicator {
    static var mbProgress: MBProgressHUD!
    
    class func showLoadingIndicator(view: UIView) {
        mbProgress = MBProgressHUD.showHUDAddedTo(view, animated: true)
        mbProgress.labelText = "Loading"
    }
    
    class func hideLoadingIndicator() {
        mbProgress.hide(true)
    }
}