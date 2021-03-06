//
//  PDHDeliveryAddressView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/13/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHDeliveryAddressView: PDHView {
    
    var editAddressView: PDHEditAddressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editAddressView = UINib(
            nibName: "PDHEditAddressView",
            bundle: NSBundle.mainBundle()
            ).instantiateWithOwner(nil, options: nil)[0] as! PDHEditAddressView
        editAddressView.delegate = self
    }
    
    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }

    override func layoutSubviews() {
        editAddressView.frame = self.bounds
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHAddressIdentifier",
            forIndexPath: indexPath) as! PDHDeliveryAddressCustomCell
        cell.delegate = self
        cell.indexPath = indexPath
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

extension PDHDeliveryAddressView: PDHDeliveryAddressCustomCellDelegate {
    func editAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath) {
        self.addSubview(editAddressView)
    }
    
    func selectAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath) {
        
    }
}

extension PDHDeliveryAddressView: PDHEditAddressViewDelegate {
    func editAddressViewBtnClicked(view: PDHEditAddressView) {
        editAddressView.removeFromSuperview()
    }

    func overlayViewClicked(overlayView: PDHEditAddressView) {
        overlayView.removeFromSuperview()
    }
}