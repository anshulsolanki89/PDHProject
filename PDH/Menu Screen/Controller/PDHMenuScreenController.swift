//
//  PDHMenuScreenController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/2/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol PDHMenuScreenControllerDelegate {
    optional func toggleLeftPanel()
}

class PDHMenuScreenController: PDHViewController {
    
    private var menuDataManager: PDHMenuDataManager!
    private var numberOfOperations = 2
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
    
    private func addDishToOrderCart(dish: PDHDishDataObject) {
        PDHDataManager.addDishToOrderCart(dish)
    }
}

// MARK:- ViewAction Protocol
extension PDHMenuScreenController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .MenuBtnClciked:
            delegate?.toggleLeftPanel?()
        case .AddToOrder:
            addDishToOrderCart(data!["dish"] as! PDHDishDataObject)
        case .CategoryClicked:
            self.performSegueWithIdentifier("PDHMenuViewController", sender: nil)
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