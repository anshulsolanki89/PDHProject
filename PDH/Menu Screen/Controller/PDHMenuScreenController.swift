//
//  PDHMenuScreenController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHMenuScreenController: PDHViewController {
    
    private var menuDataManager: PDHMenuDataManager!
    
    var menuView: PDHMenuScreenView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        menuView = self.view as! PDHMenuScreenView
        menuView.delegate = self
        
        initializeDataManager()
        menuView.updateData(PDHMenuDataManager.getUserData())
        menuDataManager.getDishOfWeek()
        
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK:- Private Methods
extension PDHMenuScreenController {
    private func initializeDataManager() {
        menuDataManager = PDHMenuDataManager()
        menuDataManager.delegate = self
    }
    
    private func receivedData(data: AnyObject) {
        
    }
}

// MARK:- ViewAction Protocol
extension PDHMenuScreenController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .MenuBtnClciked:
            self.revealViewController().revealToggle(nil)
        default:
            print("Default Implementation")
        }
    }

}

// MARK:- DataManager Protocol
extension PDHMenuScreenController {
    override func didReceiveDataWithSuccess(response: AnyObject) {
        menuView.updateData(response)
    }
}
