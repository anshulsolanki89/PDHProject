//
//  PDHDishSearchTableView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHDishSearchTableView: PDHView {

    private var dataArray = [PDHDishDataObject]()
    private let ROW_HEIGHT: CGFloat  = 70
    
    private var vegData = [PDHVegDishDataObject]()
    private var nonVegData = [PDHNonVegDishDataObject]()
    private var dishData = [PDHDishDataObject]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateData(data: AnyObject) {
        if let data = data as? [PDHDishDataObject] {
            dishData = data
            for eachDish in dishData {
                if NSComparisonResult.OrderedSame
                    == eachDish.dishType.caseInsensitiveCompare("veg") {
                        vegData.append(eachDish as! PDHVegDishDataObject)
                } else {
                    nonVegData.append(eachDish as! PDHNonVegDishDataObject)
                }
            }
        }
    }
}

// MARK:- PDHCustomCellDelegate
extension PDHDishSearchTableView: PDHCustomCellDelegate {
    func addToOrderButtonClicked(btn: PDHDishCustomCell, atIndex index: Int) {
        delegate?.viewDidPerformAction(ViewActions.AddToOrder, data: nil)
    }
}

// MARK:- TableViewDataSource
extension PDHDishSearchTableView: UITableViewDataSource {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ROW_HEIGHT
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHDishSearchCell",
            forIndexPath: indexPath) as! PDHDishCustomCell
        cell
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}


// MARK:- TableViewDelegate
extension PDHDishSearchTableView: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}