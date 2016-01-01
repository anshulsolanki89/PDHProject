//
//  PDHQuantitySelectorView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/8/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@objc protocol PDHQuantitySelectorViewDelegate {
    func quantitySelectorViewClicked()
}

class PDHQuantitySelectorView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: PDHQuantitySelectorViewDelegate?
    
    @IBOutlet weak var addToOrderTableView: UITableView!
    
    private var dataArray = [AnyObject]()
    private var selectedDish: PDHDishDataObject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateDishQuantity(dish: PDHDishDataObject) {
        selectedDish = dish
        dataArray.append(dish)
        addToOrderTableView.reloadData()
    }
    
    @IBAction func addToOrderBtnClicked(sender: AnyObject) {
        delegate?.quantitySelectorViewClicked()
    }

    // MARK:- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count * 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "PDHQuantitySelectCell",
            forIndexPath: indexPath) as! PDHQuantitySelectorCell
        if (indexPath.row % 2) == 0 {
            cell.quantityLabel.text =
                "Half Rs "
                + (dataArray[indexPath.row] as! PDHDishDataObject).halfPrice!
                + "/-"
            cell.quantityNumberLabel.text = String((dataArray[indexPath.row] as! PDHDishDataObject).halfQuantity)
            cell.addBtn.tag = indexPath.row
            cell.subtractBtn.tag = indexPath.row
        } else {
            cell.quantityLabel.text =
                "Full Rs "
                + (dataArray[(indexPath.row / 2)] as! PDHDishDataObject).fullPrice!
                + "/-"
            cell.quantityNumberLabel.text =
                String((dataArray[(indexPath.row / 2)] as! PDHDishDataObject).fullQuantity)
            cell.addBtn.tag = indexPath.row
            cell.subtractBtn.tag = indexPath.row
        }
        cell.delegate = self
        
        return cell
    }
    
    // MARK:- TableViewDelegate
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}

// MARK:- Private Methods
extension PDHQuantitySelectorView {
    private func setQuantity(quantity: Int, indexPath: Int) {
        if (indexPath % 2) == 0 {
            selectedDish.halfQuantity = quantity
        } else {
            selectedDish.fullQuantity = quantity
        }
    }
}

extension PDHQuantitySelectorView: PDHQuantitySelectorCellDelegate {
    func quantitySelectorCellAddBtnClicked(quantity: Int, indexPath: Int) {
        setQuantity(quantity, indexPath: indexPath)
    }
    
    func quantitySelectorCellSubtractBtnClicked(quantity: Int, indexPath: Int) {
        setQuantity(quantity, indexPath: indexPath)
    }
}