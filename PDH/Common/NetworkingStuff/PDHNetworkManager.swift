//
//  PDHNetworkManager.swift
//  PDH
//
//  Created by Anshul Solanki on 12/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import AFNetworking

//protocol PDHNetworkManagerDelegate: class {
//    // TODO:- Make your own error class and make it project error object specific
//    func networkManagerDidFailWithError(error: AnyObject)
//    func networkManagerDidReceiveDataWithSuccessResponse(successResponse: AnyObject)
//    func netwokrManagerDidReceiveDataWithErrorResponse(errorResponse: AnyObject)
//}

class PDHNetworkManager: NSObject {
    
//    weak var delegate: PDHNetworkManagerDelegate?
    
    class func postRequesForURLWith(
        url: String,
        params: [String: AnyObject],
        success: (response: AnyObject?) -> Void,
        failure: (error: NSError) -> Void)
    {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.POST(
            url,
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
}