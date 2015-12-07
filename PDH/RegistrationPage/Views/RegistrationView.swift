//
//  RegistrationView.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class RegistrationView: PDHView {
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeBackBtnImage()
    }
    
    private func changeBackBtnImage() {
        backBtn = PDHHelper.whiteBackBtn(backBtn)
    }
    
    @IBAction func backBtnAction(sender: AnyObject) {
        delegate?.viewPerformedAction(ViewActions.Back)
    }
   
    deinit {
        print("\(self) -> deallocated")
    }
}