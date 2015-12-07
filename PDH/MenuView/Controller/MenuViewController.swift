//
//  MenuViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UIPageViewControllerDataSource {
    
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
        nonVegDishVC = createDishMenuVC()
        mixDishVC = createDishMenuVC()
        
        pageViewContentArray = [vegDishVC, nonVegDishVC, mixDishVC]
        
        pageViewController.setViewControllers([vegDishVC],
            direction: UIPageViewControllerNavigationDirection.Forward,
            animated: false) { (finished) -> Void in
            
        }
        
        pageViewController.view.frame = CGRect(x: 0,
            y: (64 + 44),
            width: self.view.frame.size.width,
            height: (self.view.frame.size.height - 64 - 44))
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}