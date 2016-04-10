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
    private var addToOrderView: PDHQuantitySelectorView!
    private var dishSelected: PDHDishDataObject!
    private var selectedDishIndexPath: NSIndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateData(data: [PDHDishDataObject]) {
        dishData = data
        refreshData()
    }

    func refreshData() {
        dishTableView.reloadData()
    }
}

// MARK:- Private
extension PDHDishSearchTableView {
    private func createAddToOrderView() {
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let quantitySelectorVC = sb.instantiateViewControllerWithIdentifier("PDHQuantiySelectVC")
        addToOrderView = (quantitySelectorVC.view as! PDHQuantitySelectorView)
        addToOrderView.delegate = self
    }

    private func showAddToOrderView() {
        addToOrderView.updateDishQuantity(dishSelected)
        window?.addSubview(addToOrderView)
    }

    private func updateSelectedDishQuantity(cell: PDHDishCustomCell, selectedDish: PDHDishDataObject! ) {
        guard nil != selectedDish else {
            return
        }

        if (selectedDish.fullQuantity + selectedDish.halfQuantity) == 0 {
            cell.dishQuantityLabel.hidden = true
            cell.addToOrderBtn.backgroundColor = UIColor.clearColor()
            cell.addToOrderBtn.layer.borderColor = UIColor.rgb(121, g: 207, b: 63, α: 1).CGColor
            cell.addToOrderBtn.setTitleColor(UIColor.rgb(255, g: 196, b: 18, α: 1),
                forState: .Normal)
            cell.addToOrderBtn.setTitle("Add to order", forState: .Normal)
        } else {
            cell.dishQuantityLabel.hidden = false
            cell.addToOrderBtn.backgroundColor = UIColor.rgb(121, g: 207, b: 63, α: 1)
            cell.addToOrderBtn.layer.borderColor = UIColor.rgb(121, g: 207, b: 63, α: 1).CGColor
            cell.addToOrderBtn.clipsToBounds = true
            cell.addToOrderBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            cell.addToOrderBtn.setTitle("Modify", forState: .Normal)
            cell.dishQuantityLabel.text =
                String(selectedDish.fullQuantity + selectedDish.halfQuantity)
        }
    }

}

// MARK: PDHQuantitySelectorViewDelegate
extension PDHDishSearchTableView: PDHQuantitySelectorViewDelegate {
    func quantitySelectorViewClicked() {
        delegate?.viewDidPerformAction(ViewActions.AddToOrder, data:["dish" : dishSelected])
        NSNotificationCenter.defaultCenter().postNotificationName(
            DISH_QUANTITY_CHANGED_NOTIFICATION,
            object: [SELECTED_DISH : dishSelected])
        refreshData()
        addToOrderView.removeFromSuperview()
    }

    func dismissQuantitySelectorView() {
        addToOrderView.removeFromSuperview()
    }
}

// MARK:- PDHCustomCellDelegate
extension PDHDishSearchTableView: PDHCustomCellDelegate {
    func addToOrderButtonClicked(btn: PDHDishCustomCell, atIndex index: Int) {
        selectedDishIndexPath = NSIndexPath(forItem: index, inSection: 0)
        dishSelected = dishData[index]
        createAddToOrderView()
        showAddToOrderView()
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
        updateSelectedDishQuantity(cell, selectedDish: dishData[indexPath.row])

        return cell
    }
}


// MARK:- TableViewDelegate
extension PDHDishSearchTableView: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}