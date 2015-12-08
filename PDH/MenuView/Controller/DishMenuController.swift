//
//  DishMenuController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

protocol PDHDishMenuControllerDelegate: class {
    func dishClicked(dishController: DishMenuController)
}

class DishMenuController: UIViewController, ViewActionDelegate {
    
    var dishListView: DishSearchTableView!
    weak var delegate: PDHDishMenuControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishListView = self.view as! DishSearchTableView
        dishListView.delegate = self
    }
    
    func viewPerformedAction(action: ViewActions) {
        switch action {
        case .AddToOrder:
            delegate?.dishClicked(self)
        default:
            fatalError("Switch case not handled properly!")
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}