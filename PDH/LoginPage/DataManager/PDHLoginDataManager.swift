//
//  PDHLoginDataManager.swift
//  PDH
//
//  Created by Ellan Jesse on 12/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHLoginDataManager: PDHDataManager {
    
    func loginWithData(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.LOGIN_URL,
            params: data,
            success: { (data) -> Void in
                print("\(data)")
                if let data = data {
                    let jsonData = JSON(data)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHLoginDataParser.parseLoginObject(jsonData["Result"]))
                    } else {
                        self.delegate?.didReceiveDataWithError?(
                            PDHLoginDataParser.parseErrorObject(jsonData["Result"]))
                    }
                } else {
                    self.delegate?.didReceiveDataWithError?(nil)
                }
            }, failure: { (error) -> Void in
                print("\(error)")
                self.delegate?.didFailWithError?(error.localizedDescription)
        })
        
    }
}
