//
//  PDHQuantitySelectorCell.swift
//  PDH
//
//  Created by Ellan Jesse on 1/1/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

@objc protocol PDHQuantitySelectorCellDelegate {
    func quantitySelectorCellAddBtnClicked(quantity:Int, indexPath: Int)
    func quantitySelectorCellSubtractBtnClicked(quantity:Int, indexPath: Int)
}

class PDHQuantitySelectorCell: UITableViewCell {
    
    weak var delegate: PDHQuantitySelectorCellDelegate?
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityNumberLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subtractBtn: UIButton!
    
    @IBAction func addBtnClicked(sender: AnyObject) {
        var quantity = Int(quantityNumberLabel.text!)!
        quantityNumberLabel.text = String(++quantity)
        delegate?.quantitySelectorCellAddBtnClicked(quantity, indexPath: sender.tag)
    }
    
    @IBAction func subtractBtnClicked(sender: AnyObject) {
        var quantity = Int(quantityNumberLabel.text!)!
        if quantity == 0 {
            return
        }
        quantityNumberLabel.text = String(--quantity)
        delegate?.quantitySelectorCellSubtractBtnClicked(quantity, indexPath: sender.tag)
    }
}