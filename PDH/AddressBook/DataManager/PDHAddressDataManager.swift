//
//  PDHAddressDataManager.swift
//  PDH
//
//  Created by Anshul Solanki on 4/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHAddressDataManager: PDHDataManager {

    func getUserAddressHistory(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.GET_USER_ADDRESS,
            params: data,
            success: { (data) -> Void in
                print("\(data)")
                if let data = data {
                    let jsonData = JSON(data)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHAddressDataParser.parseUserAddressData(jsonData["Result"]["Record"].arrayValue ))
                    } else {
                        self.delegate?.didReceiveDataWithError?(
                            PDHAddressDataParser.parseErrorObject(jsonData["Result"]))
                    }
                } else {
                    self.delegate?.didReceiveDataWithError?(nil)
                }
            }, failure: { (error) -> Void in
                print("\(error)")
                self.delegate?.didFailWithError?(error.localizedDescription)
        })

    }

    func addNewUserAddress(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.ADD_NEW_ADDRESS,
            params: data,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(jsonData["Result"]["ErrorMsg"].stringValue)
                    } else {
                        self.delegate?.didReceiveDataWithError?(
                            PDHAddressDataParser.parseErrorObject(jsonData["Result"]))
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