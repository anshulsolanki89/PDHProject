//
//  PDHMenuView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/8/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
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
        
        UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).font =
            PDHHelper.getSkiaRegularFont(16)
        UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).textColor =
            PDHHelper.getCancelBtnColor()
    }
}