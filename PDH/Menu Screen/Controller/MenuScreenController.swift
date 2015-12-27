//
//  MenuScreenController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class MenuScreenController: UIViewController,  ViewActionDelegate {
    
    private var isSliderVisible = false
    
    var menuView: MenuScreenView!
    
    @IBOutlet weak var dishSearchTableView: DishSearchTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        menuView = self.view as! MenuScreenView
        menuView.delegate = self
    }
    
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .MenuBtnClciked:
            self.revealViewController().revealToggle(nil)
        default:
            print("Default Implementation")
        }
    }
        
    deinit {
        print("\(self) DEALLOCATED")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}