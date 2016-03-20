//
//  PDHMenuViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 12/5/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class PDHMenuViewController: PDHViewController {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var menuDishScrollView: UIScrollView!
    private var menuDataManager: PDHMenuDataManager!

    var currentPage: CGFloat = 1 {
        didSet {
            if currentPage <= 1 {
                bottomView.frame = CGRect(x: 0, y: bottomView.frame.origin.y, width: bottomView.frame.size.width, height: bottomView.frame.size.height)
            } else if currentPage <= 2 {
                bottomView.frame = CGRect(x: bottomView.frame.size.width, y: bottomView.frame.origin.y, width: bottomView.frame.size.width, height: bottomView.frame.size.height)
            } else {
                bottomView.frame = CGRect(x: (bottomView.frame.size.width * 2), y: bottomView.frame.origin.y, width: bottomView.frame.size.width, height: bottomView.frame.size.height)
            }
        }
    }
    
    var vegDishVC: PDHDishMenuController!
    var nonVegDishVC: PDHDishMenuController!
    var mixDishVC: PDHDishMenuController!
   
    var pageViewController: UIPageViewController!
    var pageViewContentArray :[PDHDishMenuController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHMenuView).delegate = self
        createPageViewController()

        PDHProgressIndicator.showLoadingIndicator(self.view)

        initializeDataManager()
        menuDataManager.getDishMenu()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuDishScrollView.contentSize = CGSize(
            width: (self.view.frame.size.width * 3),
            height: menuDishScrollView.frame.size.height)
        
        // First Page
        mixDishVC.view.frame = CGRect(x: 0,
            y: 0,
            width: menuDishScrollView.frame.size.width,
            height: menuDishScrollView.frame.size.height)
        // Second Page
        vegDishVC.view.frame = CGRect(x: menuDishScrollView.frame.size.width,
            y:0,
            width: menuDishScrollView.frame.size.width,
            height: menuDishScrollView.frame.size.height)
        // Third Page
        nonVegDishVC.view.frame = CGRect(x: (menuDishScrollView.frame.size.width * 2),
            y: 0,
            width: menuDishScrollView.frame.size.width,
            height: menuDishScrollView.frame.size.height)
        
        menuDishScrollView.addSubview(mixDishVC.view)
        menuDishScrollView.addSubview(vegDishVC.view)
        
        menuDishScrollView.addSubview(nonVegDishVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

// Mark:- Private methods
extension PDHMenuViewController {
    private func initializeDataManager() {
        menuDataManager = PDHMenuDataManager()
        menuDataManager.delegate = self
    }

    private func createPageViewController() {
        vegDishVC = createDishMenuVC()
        vegDishVC.delegate = self
        nonVegDishVC = createDishMenuVC()
        nonVegDishVC.delegate = self
        mixDishVC = createDishMenuVC()
        mixDishVC.delegate = self
    }

    private func createDishMenuVC() -> PDHDishMenuController {
        return self.storyboard?.instantiateViewControllerWithIdentifier("PDHDishMenuVC") as! PDHDishMenuController
    }
}

// Mark:- PDHDataManagerProtocol
extension PDHMenuViewController {
    func didReceiveDataWithSuccess(response: AnyObject) {
//        menuView.updateData(response)
        PDHProgressIndicator.hideLoadingIndicator()
    }

    override func didReceiveDataWithError(response: AnyObject?) {
        super.didReceiveDataWithError(response)
        PDHProgressIndicator.hideLoadingIndicator()
    }

    override func didFailWithError(error: String) {
        super.didFailWithError(error)
        PDHProgressIndicator.hideLoadingIndicator()
    }

}

// MARK:- DishControllerDelegate
extension PDHMenuViewController: PDHDishMenuControllerDelegate {
    func dishClicked(dishController: PDHDishMenuController) {
        let quantityVC = self.storyboard?.instantiateViewControllerWithIdentifier("PDHQuantiySelectVC")
        self.addChildViewController(quantityVC!)
        self.view.addSubview(quantityVC!.view)
        self.didMoveToParentViewController(quantityVC)
    }
}

//Mark:- View Action Delegate
extension PDHMenuViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController!.popViewControllerAnimated(true)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
}

//Mark:- ScrollViewDelegate
extension PDHMenuViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentOffset = floor(targetContentOffset.memory.x / menuDishScrollView.frame.size.width)
        currentPage = (currentOffset + 1)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        bottomView.frame = CGRect(x: (scrollView.contentOffset.x / 3), y: bottomView.frame.origin.y, width: bottomView.frame.size.width, height: bottomView.frame.size.height)
    }
}