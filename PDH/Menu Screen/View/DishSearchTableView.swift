//
//  DishSearchTableView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class DishSearchTableView: UIView, UITableViewDataSource, UITableViewDelegate {

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier("PDHDishSearchCell", forIndexPath: indexPath)
        return cell
    }
}