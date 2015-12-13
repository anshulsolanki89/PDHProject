//
//  PDHDeliveryAddressCustomCell.swift
//  PDH
//
//  Created by Anshul Solanki on 12/13/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

protocol PDHDeliveryAddressCustomCellDelegate: class {
    func selectAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath)
    func editAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath)
    
}

class PDHDeliveryAddressCustomCell: UITableViewCell {
    
    weak var delegate: PDHDeliveryAddressCustomCellDelegate?
    var indexPath: NSIndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func selectAddressBtnClicked(sender: AnyObject) {
        delegate?.selectAddressBtnClicked(self, indexPath: indexPath)
    }
    
    @IBAction func changeAddressBtnClicked(sender: AnyObject) {
        delegate?.editAddressBtnClicked(self, indexPath: indexPath)
    }
}