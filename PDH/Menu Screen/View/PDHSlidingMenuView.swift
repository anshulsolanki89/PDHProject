//
//  PDHSlidingMenuView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/4/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHSlidingMenuView: PDHView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let imageArray = ["MyProfile",
        "AddressBook",
        "Order_History",
        "Rate_Us",
        "Share",
        "Info",
        "Contact_Us"]
   
    let nameArray = ["My Profile",
        "Address book",
        "Order history",
        "Rate this app",
        "Share this app",
        "About us",
        "Contact us"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK:- UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCellWithIdentifier("PDHSlidingMenuCell",
                forIndexPath: indexPath) as! PDHSlidingMenuCustomCell
        cell.leftImageView.image = PDHHelper.imageNamed(imageArray[indexPath.row])
        cell.menuLabel.text = nameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            delegate?.viewDidPerformAction(ViewActions.MyProfile, data: nil)
        case 1:
            delegate?.viewDidPerformAction(ViewActions.AddressBook, data: nil)
        case 2:
            delegate?.viewDidPerformAction(ViewActions.OrderHistory, data: nil)
        case 3:
            delegate?.viewDidPerformAction(ViewActions.RateApp, data: nil)
        case 4:
            delegate?.viewDidPerformAction(ViewActions.ShareApp, data: nil)
        case 5:
            delegate?.viewDidPerformAction(ViewActions.AboutUs, data: nil)
        case 6:
            delegate?.viewDidPerformAction(ViewActions.ContactUs, data: nil)
        default:
            fatalError(" \(self) - Please handle the switch case")
        }
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}