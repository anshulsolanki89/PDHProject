//
//  PDHDishCell.swift
//  PDH
//
//  Created by Ellan Jesse on 4/10/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHDishCell: UITableViewCell {
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishQuantity: UILabel!
    @IBOutlet weak var dishUnitPrice: UILabel!
    @IBOutlet weak var dishTotalPrice: UILabel!

    @IBAction func deleteDishClicked(sender: UIButton) {

    }
}