//
//  PDHOrderHistoryController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/6/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHOrderHistoryController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHOrderHistoryController: ViewActionDelegate {
    
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController?.popViewControllerAnimated(true)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
}