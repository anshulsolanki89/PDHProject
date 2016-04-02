//
//  PDHMenuContainerViewController.swift
//  PDH
//
//  Created by Ellan Jesse on 1/3/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHMenuContainerViewController: PDHViewController {
    
    enum SlideOutState {
        case BothCollapsed
        case LeftPanelExpanded
    }
    
    private let centerPanelExpandedOffset: CGFloat = 40

    private var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    var leftViewController: PDHSlidingMenuController?
    var centerViewController: PDHMenuScreenController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        
        view.addSubview(centerViewController.view)
        addChildViewController(centerViewController)
        
        centerViewController.didMoveToParentViewController(self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        centerViewController.view.addGestureRecognizer(panGestureRecognizer)
    }
}

// MARK: CenterViewController delegate

extension PDHMenuContainerViewController: PDHMenuScreenControllerDelegate {
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            
            addChildSidePanelController(leftViewController!)
        }
    }
  
    func addChildSidePanelController(sidePanelController: PDHSlidingMenuController) {
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }

    func animateLeftPanel(shouldExpand shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerViewController.view.frame) - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerViewController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
  
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerViewController.view.layer.shadowOpacity = 0.8
        } else {
            centerViewController.view.layer.shadowOpacity = 0.0
        }
    }
}

// MARK: Gesture recognizer
extension PDHMenuContainerViewController: UIGestureRecognizerDelegate {
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .BothCollapsed) {
                if (gestureIsDraggingFromLeftToRight) {
                    addLeftPanelViewController()
                } else {
                    return
                }
                
                showShadowForCenterViewController(true)
            }
        case .Changed:
            if recognizer.view?.center.x < view.center.x {
                recognizer.view?.center.x  = view.center.x
            } else {
                recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
                recognizer.setTranslation(CGPointZero, inView: view)
            }
        case .Ended:
            if recognizer.view?.center.x < view.center.x {
                recognizer.view?.center.x  = view.center.x
            }
            if (leftViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            } else {
                return
            }
        default:
            break
        }

    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> PDHSlidingMenuController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("PDHSlidingMenuController") as? PDHSlidingMenuController
    }
    
    class func centerViewController() -> PDHMenuScreenController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("PDHMenuScreenController") as? PDHMenuScreenController
    }
    
}
