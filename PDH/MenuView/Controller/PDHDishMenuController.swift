//
//  PDHDishMenuController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/5/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }

    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .AddToOrder:
            break
            //delegate?.dishClicked(self)
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