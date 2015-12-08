//
//  PDHDishCustomCell.swift
//  PDH
//
//  Created by Anshul Solanki on 12/8/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

protocol PDHCustomCellDelegate: class {
    func addToOrderButtonClicked(btn: PDHDishCustomCell, atIndex index: Int)
}

class PDHDishCustomCell: UITableViewCell {
    weak var delegate: PDHCustomCellDelegate?
    
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var quantityPriceLabel: UILabel!

    @IBAction func addToOrderBtnClicked(sender: AnyObject) {
        delegate?.addToOrderButtonClicked(self, atIndex: self.tag)
    }
}