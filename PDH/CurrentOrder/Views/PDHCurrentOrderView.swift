//
//  PDHCurrentOrderView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/25/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHCurrentOrderView: PDHView {

    @IBOutlet weak var currentOrderTableView: UITableView!
    @IBOutlet weak var currentOrderPrice: UILabel!
    @IBOutlet weak var instructionTextView: UITextView!

    private var ROW_HEIGHT: CGFloat = 71
    private var FOOTER_HEIGHT: CGFloat = 71
    private var numberOfSection = 1
    private var numberOfRowsInSection = 2
    private var currentDishesOrderArray = [PDHCurrentOrderDataObject]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func backBtnClicked() {
        delegate?.viewDidPerformAction(.Back, data: nil)
    }

    func updateData(data: [PDHCurrentOrderDataObject]) {
        currentDishesOrderArray = data
        currentOrderTableView.reloadData()
    }
}

// MARK:- Private 
extension PDHCurrentOrderView {
    private func calculateUnitPrice(index: Int) -> String {
        return
            String(
                Int(currentDishesOrderArray[index].dishPrice)!
                    / Int(currentDishesOrderArray[index].dishQuantity)!)
    }
}

// MARK :- TableView data source
extension PDHCurrentOrderView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDishesOrderArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHDishCell",
            forIndexPath: indexPath) as! PDHDishCell
        cell.dishName.text = currentDishesOrderArray[indexPath.row].dishMenuTitle
        cell.dishQuantity.text = currentDishesOrderArray[indexPath.row].dishQuantity
        cell.dishTotalPrice.text = currentDishesOrderArray[indexPath.row].dishPrice
        cell.dishUnitPrice.text = calculateUnitPrice(indexPath.row)

        return cell
    }
    
}

// MARK:- TextView Delegate
extension PDHCurrentOrderView: UITextViewDelegate {

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