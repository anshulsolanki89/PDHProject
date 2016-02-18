//
//  LandingViewController.swift
//  PDH
//
//  Created by Anshul Solanki on 11/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        dataLayer.push(["event": "OpenScreen", "screenName": "PDH LandingView Controller"])
//        var tracker = GAI.sharedInstance().defaultTracker
//        tracker.set("screenName", value: "LandingView Controler")
//
//        var builder = GAIDictionaryBuilder.createScreenView()
//        tracker.send(builder.build() as [NSObject : AnyObject])
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)


        print("asdasdas")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! LandingView).delegate = self
    }
    
}

extension LandingViewController: ViewActionDelegate {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Login:
            print("\(self) -> Login")
            self.performSegueWithIdentifier("pdhLogin", sender: nil)
        case .Register:
            print("\(self) -> Register")
            self.performSegueWithIdentifier("pdhRegister", sender: nil)
        default:
            fatalError("Error")
        }
    }
}