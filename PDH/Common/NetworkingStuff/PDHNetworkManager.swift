//
//  PDHNetworkManager.swift
//  PDH
//
//  Created by Ellan Jesse on 12/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
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
    
    class func postRequesForURLWithJSON(
        url: String,
        params: [String: AnyObject],
        success: (response: AnyObject?) -> Void,
        failure: (error: NSError) -> Void)
    {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
//        manager.requestSerializer.setValue("text/html", forHTTPHeaderField: "Content-Type")
//        manager.requestSerializer.setValue("text/html", forHTTPHeaderField:"Accept");
//        manager.responseSerializer = AFJSONResponseSerializer(readingOptions: NSJSONReadingOptions.AllowFragments)
//        manager.responseSerializer.acceptableContentTypes = Set(arrayLiteral: "text/html")
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
                print("\(sessionDataTask?.response)")
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