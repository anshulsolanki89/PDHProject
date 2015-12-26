//
//  PDHNetworkManager.swift
//  PDH
//
//  Created by Anshul Solanki on 12/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import AFNetworking

class PDHNetworkManager: NSObject {
    
     class func postRequesForURLWith(url: String, params: [String: AnyObject], completionBlock: () -> Void) {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        manager.POST(
            url,
            parameters: params,
            progress: nil,
            success: { (sessionDataTask, responseObj) -> Void in
                print("\(responseObj)")
            }, failure: { (sessionDataTask, error) -> Void in
                print("\(error)")
        })
    }
}