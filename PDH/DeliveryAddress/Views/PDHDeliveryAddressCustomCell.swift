//
//  PDHDeliveryAddressCustomCell.swift
//  PDH
//
//  Created by Ellan Jesse on 12/13/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

protocol PDHDeliveryAddressCustomCellDelegate: class {
    func selectAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath)
    func editAddressBtnClicked(cell: PDHDeliveryAddressCustomCell, indexPath: NSIndexPath)
    
}

class PDHDeliveryAddressCustomCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddress: UILabel!

    weak var delegate: PDHDeliveryAddressCustomCellDelegate?
    var indexPath: NSIndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(data: PDHUserAddressDataObject) {
        
    }

    @IBAction func selectAddressBtnClicked(sender: AnyObject) {
        delegate?.selectAddressBtnClicked(self, indexPath: indexPath)
    }
    
    @IBAction func changeAddressBtnClicked(sender: AnyObject) {
        delegate?.editAddressBtnClicked(self, indexPath: indexPath)
    }
}