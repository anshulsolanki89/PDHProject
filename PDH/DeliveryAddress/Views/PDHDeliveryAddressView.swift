//
//  PDHDeliveryAddressView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/13/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHDeliveryAddressView: PDHView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHDeliveryAddressView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHAddressIdentifier",
            forIndexPath: indexPath)
        return cell
    }
}

extension PDHDeliveryAddressView: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let addressTypeView =
            tableView.dequeueReusableCellWithIdentifier("PDHAddressTypeIdentifier")
        
        return addressTypeView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
}