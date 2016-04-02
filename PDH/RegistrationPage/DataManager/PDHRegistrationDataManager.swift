//
//  PDHRegistrationDataManager.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHRegistrationDataManager: PDHDataManager {
    
    func registerWithData(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.REGISTRATION_URL,
            params: data,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHRegistrationDataParser.parseRegistrationData(data))
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