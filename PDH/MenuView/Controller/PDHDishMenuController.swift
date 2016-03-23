//
//  PDHDishMenuController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

protocol PDHDishMenuControllerDelegate: class {
    func dishClicked(dishController: PDHDishMenuController)
}

class PDHDishMenuController: UIViewController, ViewActionDelegate {
    
    var dishListView: PDHDishSearchTableView!
    weak var delegate: PDHDishMenuControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        dishListView = self.view as! PDHDishSearchTableView
        dishListView.delegate = self
    }
    
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .AddToOrder:
            delegate?.dishClicked(self)
        default:
            fatalError("Switch case not handled properly!")
        }
    }

    func setDishData(data: [PDHDishDataObject]) {
        dishListView.updateData(data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}