//
//  PDHMenuView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/8/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMenuView: PDHView {

    @IBOutlet var dishSearchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchBarUI()
    }
    
    @IBAction func backBtnClicked(sender: AnyObject) {
        delegate?.viewDidPerformAction(ViewActions.Back, data: nil)
    }

    @IBAction func chnageMenuAction(sender: UIButton) {
        delegate?.viewDidPerformAction(.ChangeMenu, data: ["menu": sender.tag])
    }
}

// MARK:- Private methods
extension PDHMenuView {
 
    private func searchBarUI() {
        let cancelBtnAttributes =
        [NSFontAttributeName: PDHHelper.getSkiaRegularFont(16),
            NSForegroundColorAttributeName: PDHHelper.getCancelBtnColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(
            cancelBtnAttributes,
            forState: UIControlState.Normal)
        
        if #available(iOS 9.0, *) {
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).font =
                PDHHelper.getSkiaRegularFont(16)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).textColor =
                PDHHelper.getCancelBtnColor()
        } else {
            // Fallback on earlier versions
        }
    }
}