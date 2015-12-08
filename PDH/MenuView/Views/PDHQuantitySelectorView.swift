//
//  PDHQuantitySelectorView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/8/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHQuantitySelectorView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK:- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHQuantitySelectCell",
            forIndexPath: indexPath)
        return cell
    }
    
    // MARK:- TableViewDelegate
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}