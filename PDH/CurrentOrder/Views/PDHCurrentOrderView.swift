//
//  PDHCurrentOrderView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/25/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHCurrentOrderView: PDHView {
    
    private var ROW_HEIGHT: CGFloat = 71
    private var FOOTER_HEIGHT: CGFloat = 71
    private var numberOfSection = 1
    private var numberOfRowsInSection = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }
}

extension PDHCurrentOrderView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "DishQuantityCell",
            forIndexPath: indexPath)
        return cell
    }
    
}

extension PDHCurrentOrderView: UITableViewDelegate {
    
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = tableView.dequeueReusableCellWithIdentifier("DeliveryDetails")
//        return footerView
//    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ROW_HEIGHT
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ROW_HEIGHT
    }
    
//    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        return FOOTER_HEIGHT
//    }
//    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}