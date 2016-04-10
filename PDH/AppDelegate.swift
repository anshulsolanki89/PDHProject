//
//  AppDelegate.swift
//  PDH
//
//  Created by Ellan Jesse on 11/25/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import UIKit
import FBSDKCoreKit

let DISH_QUANTITY_CHANGED_NOTIFICATION = "pdh.dish.quantity.changed"
let SELECTED_DISH = "pdh.dish.selectedDish"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var customDishCartView: PDHCustomDishCartView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        if PDHDataManager.getUserData() != nil {
            let menuViewController =
                UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menuScreen")
            let rootViewController = UINavigationController(rootViewController: menuViewController)
            rootViewController.navigationBarHidden = true
            window!.rootViewController = rootViewController
            window!.makeKeyAndVisible()
        }

        createCustomDishCartView()

        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "dishQuantityChanged:",
            name: DISH_QUANTITY_CHANGED_NOTIFICATION,
            object: nil)

        return true
    }

    private func createCustomDishCartView() {
        customDishCartView = PDHCustomDishCartView.instanceFromNib() as? PDHCustomDishCartView
        customDishCartView!.frame =
            CGRect(x: 0,
                y: (window!.rootViewController!.view.frame.size.height - 73),
                width: window!.rootViewController!.view.frame.size.width,
                height: 73)
    }

    func dishQuantityChanged(notification: NSNotification) {
        let selectedDish = notification.object![SELECTED_DISH] as! PDHDishDataObject
        PDHOrderCart.pdhCart.addDishToOrder(selectedDish)
        if PDHOrderCart.pdhCart.totalDishes() > 0 {
            self.customDishCartView!.changeQuantity(PDHOrderCart.pdhCart.totalDishes())
            self.customDishCartView!.changeTotalPrice(PDHOrderCart.pdhCart.totalPrice())
            self.window!.rootViewController!.view.addSubview(self.customDishCartView!)
        } else {
            self.customDishCartView!.removeFromSuperview()
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        //
        FBSDKAppEvents.activateApp()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(
            application,
            openURL: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
}
