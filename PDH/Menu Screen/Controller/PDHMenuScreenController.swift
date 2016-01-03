//
//  PDHMenuScreenController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol PDHMenuScreenControllerDelegate {
    optional func toggleLeftPanel()
}

class PDHMenuScreenController: PDHViewController {
    
    private var menuDataManager: PDHMenuDataManager!
    private var numberOfOperations = 3
    var menuView: PDHMenuScreenView!
    
    weak var delegate: PDHMenuScreenControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        menuView = self.view as! PDHMenuScreenView
        menuView.delegate = self

        PDHProgressIndicator.showLoadingIndicator(self.view)

        initializeDataManager()
        
        menuView.updateData(PDHMenuDataManager.getUserData()!)
        menuDataManager.getDishOfWeek()
        menuDataManager.getRestaurantMenu()
        menuDataManager.getDishMenu()
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
    
    private func showAddToOrderView() {
        
    }
}

// MARK:- ViewAction Protocol
extension PDHMenuScreenController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .MenuBtnClciked:
            delegate?.toggleLeftPanel?()
        case .AddToOrder: break
            
        default:
            print("Default Implementation")
        }
    }

    func hideLoadingIndicator() {
        if --numberOfOperations == 0 {
            PDHProgressIndicator.hideLoadingIndicator()
        }
    }
}

// MARK:- DataManager Protocol
extension PDHMenuScreenController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        menuView.updateData(response)
        hideLoadingIndicator()
    }
    
    override func didReceiveDataWithError(response: AnyObject?) {
        super.didReceiveDataWithError(response)
        hideLoadingIndicator()
    }
    
    override func didFailWithError(error: String) {
        super.didFailWithError(error)
        hideLoadingIndicator()
    }
}