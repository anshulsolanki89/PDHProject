//
//  PDHOrderHistoryView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/6/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHOrderHistoryView: PDHView, UITableViewDataSource, UITableViewDelegate {
    
    let rowHeight: CGFloat = 65.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }
    
    // MARK:- TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PDHOrderHistoryCell",
            forIndexPath: indexPath)
        return cell
    }
    
    // MARK:- TableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return rowHeight
    }
}