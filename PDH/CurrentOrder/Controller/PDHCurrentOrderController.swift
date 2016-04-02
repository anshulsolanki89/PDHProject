//
//  PDHCurrentOrderController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/25/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHCurrentOrderController: PDHViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHCurrentOrderView).delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHCurrentOrderController: ViewActionDelegate {
    
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController?.popViewControllerAnimated(true)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
}