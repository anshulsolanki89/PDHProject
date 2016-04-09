//
//  PDHDishCustomCell.swift
//  PDH
//
//  Created by Ellan Jesse on 12/8/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

protocol PDHCustomCellDelegate: class {
    func addToOrderButtonClicked(cell: PDHDishCustomCell, atIndex index: Int)
}

class PDHDishCustomCell: UITableViewCell {
    weak var delegate: PDHCustomCellDelegate?
    
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var quantityPriceLabel: UILabel!
    @IBOutlet weak var dishQuantityLabel: UILabel!
    @IBOutlet weak var addToOrderBtn: UIButton!

    @IBAction func addToOrderBtnClicked(sender: AnyObject) {
        delegate?.addToOrderButtonClicked(self, atIndex: self.tag)
    }
}