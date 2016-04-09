//
//  PDHAddressBookView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/24/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHAddressBookView: PDHView {

    @IBOutlet weak var userAddressTableView: UITableView!
    
    var editAddressView: PDHEditAddressView!
    private var userAddresses = [PDHUserAddressDataObject]()
    private var editIndexPath: NSIndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        editAddressView = UINib(
            nibName: "PDHEditAddressView",
            bundle: NSBundle.mainBundle()
            ).instantiateWithOwner(nil, options: nil)[0] as! PDHEditAddressView
      
        editAddressView.delegate = self
    }
    
    override func layoutSubviews() {
        editAddressView.frame = self.bounds
    }

    func updateData(data: AnyObject) {
        if let userData = data as? [PDHUserAddressDataObject] {
            userAddresses = userData
            userAddressTableView.reloadData()
        }
    }

    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }
    
    @IBAction func addNewAddressAction(sender: UIButton) {
        delegate?.viewDidPerformAction(.AddAddress, data: nil)
    }

    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHAddressBookView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAddresses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHDeliveryAddressCustomCell",
            forIndexPath: indexPath) as! PDHDeliveryAddressCustomCell
        cell.userName.text = userAddresses[indexPath.row].name
        cell.userAddress.text = getUserAddressFormattedString(userAddresses[indexPath.row])
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }

    private func getUserAddressFormattedString(userAddress: PDHUserAddressDataObject) -> String {
        var addressString = ""
        addressString = userAddress.address
        addressString = (addressString + "\n" + userAddress.locality + " " + userAddress.pincode)
        addressString = addressString + "\n" + "Mob No - " + userAddress.mobile
        return addressString
    }
}

extension PDHAddressBookView: UITableViewDelegate {
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
        return 100
    }
}

extension PDHAddressBookView: PDHDeliveryAddressCustomCellDelegate {
    func editAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath) {
        editIndexPath = indexPath
        editAddressView.addressTextView.text = userAddresses[indexPath.row].address
            + ", "
            + userAddresses[indexPath.row].locality
            + " - "
            + userAddresses[indexPath.row].pincode
        editAddressView.mobileTextFIeld.text = userAddresses[indexPath.row].mobile
        self.addSubview(editAddressView)
    }

    func selectAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath) {
        
    }
}

extension PDHAddressBookView: PDHEditAddressViewDelegate {
    func editAddressViewBtnClicked(view: PDHEditAddressView) {
        var addressDict = [String: String]()
        addressDict["uid"] = PDHDataManager.getUserData()!.email
        addressDict["id"] = "3"
        addressDict["address"] = view.addressTextView.text!
        addressDict["locality"] = userAddresses[editIndexPath.row].locality
        addressDict["pincode"] = userAddresses[editIndexPath.row].pincode
        addressDict["mobile"] = view.mobileTextFIeld.text!
//        delegate?.viewDidPerformAction(ViewActions.EditAddress, data: <#T##[String : AnyObject]?#>)
        editAddressView.removeFromSuperview()
    }

    func overlayViewClicked(overlayView: PDHEditAddressView) {
        overlayView.removeFromSuperview()
    }
}