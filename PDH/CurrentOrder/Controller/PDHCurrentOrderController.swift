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

    private var currentOrderDataManager: PDHCurrentOrderDataManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHCurrentOrderView).delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        initializeDataManager()
        fetchCurrentOrderDishes()
        PDHProgressIndicator.showLoadingIndicator(self.view)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.removeCartView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Private Methods
extension PDHCurrentOrderController {
    private func initializeDataManager() {
        if currentOrderDataManager == nil {
            currentOrderDataManager = PDHCurrentOrderDataManager()
        }
        currentOrderDataManager.delegate = self
    }

    private func fetchCurrentOrderDishes() {
        currentOrderDataManager.getDishesFromCart(
            ["uid" : PDHDataManager.getUserData()!.email])
    }
}

// MARK:- DataManager Delegate
extension PDHCurrentOrderController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? [PDHCurrentOrderDataObject] {
            (self.view as! PDHCurrentOrderView).updateData(response)
        }
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