//
//  PDHLoginDataManager.swift
//  PDH
//
//  Created by Anshul Solanki on 12/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import AFNetworking

class PDHLoginDataManager {
    
    class func loginWithData(data: AnyObject) {
        PDHNetworkManager.postRequesForURLWith(PDHConstantURL.LOGIN_URL, params: data as! [String : AnyObject])
            { () -> Void in
            print("completed")
        }
    }
}