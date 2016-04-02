//
//  PDHSlidingMenuController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/4/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHSlidingMenuController: PDHViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHSlidingMenuView).delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Private Methods
extension PDHSlidingMenuController {
    private func showViewController(identifier: String) {
        let vc = storyboard!.instantiateViewControllerWithIdentifier(identifier)
        navigationController!.pushViewController(vc, animated: true)
    }
}

// MARK:- ViewActionDelegate
extension PDHSlidingMenuController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .MyProfile:
            showViewController("PDHMyProfileVC")
        case .AddressBook:
            showViewController("PDHAddressBookVC")
        case .OrderHistory:
            showViewController("PDHOrderHistoryVC")
        case .RateApp:
            print("Rate App has not been implement yet")
//            showViewController("")
        case .ShareApp:
            print("Share App has not been implement yet")
//            showViewController("")
        case .AboutUs:
            print("About Us has not been implement yet")
//            showViewController("")
        case .ContactUs:
            print("Contact Us has not been implement yet")
//            showViewController("")
        default:
            fatalError("\(self) switch case not handled porperly")
      
        }
    }
}