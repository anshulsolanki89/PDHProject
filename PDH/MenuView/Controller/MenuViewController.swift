//
//  MenuViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UIPageViewControllerDataSource, PDHDishMenuControllerDelegate {
    
    let numberOfPages = 3
    
    var vegDishVC: DishMenuController!
    var nonVegDishVC: DishMenuController!
    var mixDishVC: DishMenuController!
   
    var pageViewController: UIPageViewController!
    var pageViewContentArray :[DishMenuController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
    }
    
    private func createPageViewController() {
        pageViewController =
            self.storyboard?.instantiateViewControllerWithIdentifier("PDHPageViewController") as! UIPageViewController
        pageViewController.dataSource = self
        
        vegDishVC = createDishMenuVC()
        vegDishVC.delegate = self
        nonVegDishVC = createDishMenuVC()
        nonVegDishVC.delegate = self
        mixDishVC = createDishMenuVC()
        mixDishVC.delegate = self
        
        pageViewContentArray = [vegDishVC, nonVegDishVC, mixDishVC]
        
        pageViewController.setViewControllers([vegDishVC],
            direction: UIPageViewControllerNavigationDirection.Forward,
            animated: false) { (finished) -> Void in
            
        }
        
        pageViewController.view.frame = CGRect(x: 0,
            y: (84 + 44 + 44),
            width: self.view.frame.size.width,
            height: (self.view.frame.size.height - 84 - 44 - 44))
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
    
    private func createDishMenuVC() -> DishMenuController {
        return self.storyboard?.instantiateViewControllerWithIdentifier("PDHDishMenuVC") as! DishMenuController
    }
    
    // MARK: - PageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = pageViewController.viewControllers!.indexOf(viewController)
        
        if pageIndex > 0 {
            return pageViewContentArray[pageIndex! - 1]
        }
            
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageIndex = pageViewController.viewControllers!.indexOf(viewController)

        if pageIndex! < numberOfPages {
            return pageViewContentArray[pageIndex! + 1]
        }
            
        return nil
    }
    
    // MARK:- DishControllerDelegate
    func dishClicked(dishController: DishMenuController) {
        let quantityVC = self.storyboard?.instantiateViewControllerWithIdentifier("PDHQuantiySelectVC")
        self.addChildViewController(quantityVC!)
        self.view.addSubview(quantityVC!.view)
        self.didMoveToParentViewController(quantityVC)        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}