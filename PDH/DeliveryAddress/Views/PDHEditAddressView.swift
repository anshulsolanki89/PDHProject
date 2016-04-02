//
//  PDHEditAddressVieww.swift
//  PDH
//
//  Created by Ellan Jesse on 12/13/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

protocol PDHEditAddressViewDelegate: class {
    func editAddressViewBtnClicked(view: PDHEditAddressView)
}

class PDHEditAddressView: UIView {
    
    weak var delegate: PDHEditAddressViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func doneBtnClicked(sender: UIButton) {
        delegate?.editAddressViewBtnClicked(self)
    }
}