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
    
    class func postRequesForURLWith(
        url: String,
        params: [String: AnyObject],
        success: (response: AnyObject?) -> Void,
        failure: (error: NSError) -> Void)
    {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.POST(url,
            parameters: params,
            progress: nil,
            success: { (sessionDataTask, responseObj) -> Void in
                print("\(responseObj)")
                if let responseObj = responseObj {
                    success(response: responseObj)
                } else {
                    success(response: nil)
                }
            }, failure: { (sessionDataTask, error) -> Void in
                print("\(error)")
                
                failure(error: error)
        })
    }
    
    class func getRequestForURL(url: String,
        success: (response: AnyObject?) -> Void,
        failure: (error: NSError) -> Void) {
        let manager = AFHTTPSessionManager()
        manager.GET(url,
            parameters: nil,
            progress: nil,
            success: { (sessionDataTask, responseObj) -> Void in
                print("\(responseObj)")
                if let responseObj = responseObj {
                    success(response: responseObj)
                } else {
                    success(response: nil)
                }
            }, failure: { (sessionDataTask, error) -> Void in
                print("\(error)")
                
                failure(error: error)
        })

    }
}