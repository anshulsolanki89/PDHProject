//
//  PDHMenuViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 12/5/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMenuViewController: PDHViewController {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var menuDishScrollView: UIScrollView!

    var screenTitle: String!
    private var menuDataManager: PDHMenuDataManager!
    private var dishData = [PDHDishDataObject]()

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
    
    var vegDishVC: PDHDishMenuController?
    var nonVegDishVC: PDHDishMenuController?
    var mixDishVC: PDHDishMenuController?
   
    var pageViewController: UIPageViewController!
    var pageViewContentArray :[PDHDishMenuController]!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        (self.view as! PDHMenuView).screenTitle.text = screenTitle
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.addCustomCartView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! PDHMenuView).delegate = self
        PDHProgressIndicator.showLoadingIndicator(self.view)

        initializeDataManager()
        menuDataManager.getDishMenu()
        menuDishScrollView.showsHorizontalScrollIndicator = false
        menuDishScrollView.showsVerticalScrollIndicator = false
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuDishScrollView.contentSize = CGSize(
            width: (self.view.frame.size.width * 3),
            height: menuDishScrollView.frame.size.height)

        if nil != mixDishVC {
            // First Page
            mixDishVC!.view.frame = CGRect(x: 0,
                y: 0,
                width: menuDishScrollView.frame.size.width,
                height: menuDishScrollView.frame.size.height)
            // Second Page
            vegDishVC!.view.frame = CGRect(x: menuDishScrollView.frame.size.width,
                y:0,
                width: menuDishScrollView.frame.size.width,
                height: menuDishScrollView.frame.size.height)
            // Third Page
            nonVegDishVC!.view.frame = CGRect(x: (menuDishScrollView.frame.size.width * 2),
                y: 0,
                width: menuDishScrollView.frame.size.width,
                height: menuDishScrollView.frame.size.height)
            
            menuDishScrollView.addSubview(mixDishVC!.view)
            menuDishScrollView.addSubview(vegDishVC!.view)
            
            menuDishScrollView.addSubview(nonVegDishVC!.view)
            vegDishVC!.setDishData(getVegData(dishData))
            nonVegDishVC!.setDishData(getNonVegData(dishData))
            mixDishVC!.setDishData(dishData)
        }
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
        vegDishVC!.delegate = self
        nonVegDishVC = createDishMenuVC()
        nonVegDishVC!.delegate = self
        mixDishVC = createDishMenuVC()
        mixDishVC!.delegate = self

        self.view.layoutSubviews()
    }

    private func getVegData(dishes: [PDHDishDataObject]) -> [PDHVegDishDataObject] {
        var vegData = [PDHVegDishDataObject]()
        for eachDish in dishes {
            if NSComparisonResult.OrderedSame == eachDish.dishType.caseInsensitiveCompare("veg") {
                vegData.append(eachDish as! PDHVegDishDataObject)
            }
        }
        return vegData
    }

    private func getNonVegData(dishes: [PDHDishDataObject]) -> [PDHNonVegDishDataObject]{
        var nonVegData = [PDHNonVegDishDataObject]()
        for eachDish in dishes {
            if NSComparisonResult.OrderedSame != eachDish.dishType.caseInsensitiveCompare("veg") {
                nonVegData.append(eachDish as! PDHNonVegDishDataObject)
            }
        }
        return nonVegData
    }

    private func createDishMenuVC() -> PDHDishMenuController {
        return self.storyboard?.instantiateViewControllerWithIdentifier("PDHDishMenuVC") as! PDHDishMenuController
    }

    private func refreshPageData(page: Int) {
        switch page {
        case 1:
            (mixDishVC!.view as! PDHDishSearchTableView).refreshData()
        case 2:
            (vegDishVC!.view as! PDHDishSearchTableView).refreshData()
        case 3:
            (nonVegDishVC!.view as! PDHDishSearchTableView).refreshData()
        default:
            break
        }
    }

    private func changeMenu(menuPos: Int) {
        if menuPos != Int(currentPage) {
            menuDishScrollView.scrollRectToVisible(CGRect(
                x: (CGFloat(menuPos - 1) * self.view.frame.size.width),
                y: 0,
                width: self.view.frame.size.width,
                height: menuDishScrollView.frame.size.height),
                animated: true)
            currentPage += 1
            refreshPageData(menuPos)
        }
    }
}

// Mark:- PDHDataManagerProtocol
extension PDHMenuViewController {
    func didReceiveDataWithSuccess(response: AnyObject) {
        if let data = response as? [PDHDishDataObject] {
            dishData = data
        }
        createPageViewController()
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

// Mark:- View Action Delegate
extension PDHMenuViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String : AnyObject]?) {
        switch action {
        case .Back:
            navigationController!.popViewControllerAnimated(true)
        case .ChangeMenu:
            changeMenu(data!["menu"] as! Int)
        default:
            fatalError("\(self) Please handle switch case")
        }
    }
}

// Mark:- ScrollViewDelegate
extension PDHMenuViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentOffset = floor(targetContentOffset.memory.x / menuDishScrollView.frame.size.width)
        currentPage = (currentOffset + 1)
        refreshPageData(Int(currentPage))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        bottomView.frame = CGRect(x: (scrollView.contentOffset.x / 3), y: bottomView.frame.origin.y, width: bottomView.frame.size.width, height: bottomView.frame.size.height)
    }
}