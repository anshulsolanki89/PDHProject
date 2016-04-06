//
//  PDHExtensions.swift
//  PDH
//
//  Created by Anshul Solanki on 4/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {

    class func loadViewControllerWithIdentifier(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = storyboard.instantiateViewControllerWithIdentifier(identifier)

        return vc
    }
}