//
//  PDHDishSearchTableView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/2/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHDishSearchTableView: PDHView {

    @IBOutlet weak var dishTableView: UITableView!
    
    private var dataArray = [PDHDishDataObject]()
    private let ROW_HEIGHT: CGFloat  = 70
    
    private var vegData = [PDHVegDishDataObject]()
    private var nonVegData = [PDHNonVegDishDataObject]()

    private var dishData = [PDHDishDataObject]()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateData(data: [PDHDishDataObject]) {
        dishData = data
        dishTableView.reloadData()
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
        return dishData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHDishSearchCell",
            forIndexPath: indexPath) as! PDHDishCustomCell
        cell.dishNameLabel.text = dishData[indexPath.row].title
        cell.quantityPriceLabel.text =
            "Half Rs " + dishData[indexPath.row].halfPrice
            + " / "
            + "Full Rs " + dishData[indexPath.row].fullPrice
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