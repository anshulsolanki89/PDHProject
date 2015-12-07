//
//  SlidingMenuView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/4/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class SlidingMenuView: UIView, UITableViewDataSource, UITableViewDelegate {
    
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
                forIndexPath: indexPath) as! SlidingMenuCustomCell
        cell.leftImageView.image = PDHHelper.imageNamed(imageArray[indexPath.row])
        cell.menuLabel.text = nameArray[indexPath.row]
        
        return cell
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}