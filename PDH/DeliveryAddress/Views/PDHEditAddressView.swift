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
    func overlayViewClicked(overlayView: PDHEditAddressView)
}

class PDHEditAddressView: UIView {
    
    weak var delegate: PDHEditAddressViewDelegate?
    
    @IBOutlet weak var mobileTextFIeld: PDHCustomTextField!
    @IBOutlet weak var addressTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: "overlayViewClicked:")
        self.addGestureRecognizer(tapGesture)
    }

    func overlayViewClicked(tapGesture: UITapGestureRecognizer) {
        delegate?.overlayViewClicked(self)
    }

    @IBAction func doneBtnClicked(sender: UIButton) {
        delegate?.editAddressViewBtnClicked(self)
    }
    
}