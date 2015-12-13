//
//  PDHEditAddressVieww.swift
//  PDH
//
//  Created by Anshul Solanki on 12/13/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
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