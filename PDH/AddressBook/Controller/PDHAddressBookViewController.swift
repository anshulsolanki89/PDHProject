//
//  PDHAddressBookViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/24/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHAddressBookViewController: PDHViewController {

    private var addressDataManager: PDHAddressDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHAddressBookView).delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        PDHProgressIndicator.showLoadingIndicator(self.view)
        initializeDataManager()
        fetchUserAddresses()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

extension PDHAddressBookViewController {
    private func initializeDataManager() {
        if nil == addressDataManager {
            addressDataManager = PDHAddressDataManager()
            addressDataManager.delegate = self
        }
    }

    private func fetchUserAddresses() {
        if let userData = PDHDataManager.getUserData() {
            addressDataManager.getUserAddressHistory(["uid" : userData.uid])
        }
    }

    private func showNewAddressViewController() {
        performSegueWithIdentifier("PDHNewAddressViewController", sender: nil)
    }
}

extension PDHAddressBookViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController!.popViewControllerAnimated(true)
        case .AddAddress:
            showNewAddressViewController()
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
    
}

// MARK:- DataManager Protocol
extension PDHAddressBookViewController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? [PDHUserAddressDataObject] {
            (self.view as! PDHAddressBookView).updateData(response)
        }
    }
}