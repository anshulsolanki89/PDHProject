//
//  PDHDishSearchTableView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHDishSearchTableView: PDHView, UITableViewDataSource, UITableViewDelegate, PDHCustomCellDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK:- TableViewDataSource
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHDishSearchCell",
        forIndexPath: indexPath) as! PDHDishCustomCell
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    // MARK:- TableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK:- PDHCustomCellDelegate
    func addToOrderButtonClicked(btn: PDHDishCustomCell, atIndex index: Int) {
        delegate?.viewDidPerformAction(ViewActions.AddToOrder, data: nil)
    }
}