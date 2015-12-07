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
    
    @IBOutlet weak var slidingView: UIView!
    var menuView: MenuScreenView!
    
    @IBOutlet weak var dishSearchTableView: DishSearchTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView = self.view as! MenuScreenView
        menuView.delegate = self
        self.slidingView.frame = CGRect(x: -(self.view.frame.size.width - 32),
            y: self.slidingView.frame.origin.y,
            width: (self.view.frame.size.width - 32),
            height: self.slidingView.frame.size.height)
       
        print("\(slidingView)")
    }
    
    func viewPerformedAction(action: ViewActions) {
        switch action {
        case .MenuBtnClciked:
            showHideSlider()
        default:
            print("Default Implementation")
        }
    }
    
    private func showHideSlider() {
        
        if isSliderVisible {
            UIView.animateWithDuration(0.5, animations: { [unowned self] () -> Void in
            self.menuView.frame = CGRect(x: 0,
                y: self.menuView.frame.origin.y,
                width: self.menuView.frame.size.width,
                height: self.menuView.frame.size.height)

            self.slidingView.frame = CGRect(x: -(self.view.frame.size.width - 32),
                y: self.slidingView.frame.origin.y,
                width: self.slidingView.frame.size.width,
                height: self.slidingView.frame.size.height)
                }, completion: { (success) -> Void in
                    self.isSliderVisible = false
            })
        } else {
            UIView.animateWithDuration(0.5,
                animations: { [unowned self] () -> Void in
                self.slidingView.frame = CGRect(x: 0,
                    y: self.slidingView.frame.origin.y,
                    width: self.slidingView.frame.size.width,
                    height: self.slidingView.frame.size.height)

                self.menuView.frame = CGRect(x: (self.menuView.frame.size.width - 32),
                    y: self.menuView.frame.origin.y,
                    width: self.menuView.frame.size.width,
                    height: self.menuView.frame.size.height)
                
                }, completion: { (success) -> Void in
                    self.isSliderVisible = true
            })
            }
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}