//
//  PDHMyProfileController.swift
//  PDH
//
//  Created by Ellan Jesse on 1/3/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMyProfileController: PDHViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHMyProfileView).delegate = self
    }
}

extension PDHMyProfileController: ViewActionDelegate {
    
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController?.popViewControllerAnimated(true)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
}