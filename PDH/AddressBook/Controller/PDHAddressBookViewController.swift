//
//  PDHAddressBookViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/24/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHAddressBookViewController: PDHViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHAddressBookView).delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHAddressBookViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController!.popViewControllerAnimated(true)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
    
}