//
//  PDHOrderCartManager.swift
//  PDH
//
//  Created by Ellan Jesse on 4/9/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHOrderCartManager: PDHDataManager {

    func addItemToCart(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.ADD_CART_ITEM_URL,
            params: data,
            success: { (response) -> Void in
                print("\(response)")
                //if let response = response {
                //    let jsonData = JSON(response)
                //    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                //        self.delegate?.didReceiveDataWithSuccess?(
                //            PDHRegistrationDataParser.parseRegistrationData(data))
                //    } else {
                //        self.delegate?.didReceiveDataWithError?(
                //            PDHLoginDataParser.parseErrorObject(jsonData["Result"]))
                //    }
                //} else {
                //    self.delegate?.didReceiveDataWithError?(nil)
                //}
            }, failure: { (error) -> Void in
                print("\(error)")
                //self.delegate?.didFailWithError?(error.localizedDescription)
        })
    }

    func editItemInCart(data: [String: AnyObject]) {
        PDHNetworkManager.postRequesForURLWith(
            PDHConstantURL.EDIT_CART_ITEM_URL,
            params: data,
            success: { (response) -> Void in
                print("\(response)")
                //if let response = response {
                //    let jsonData = JSON(response)
                //    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                //        self.delegate?.didReceiveDataWithSuccess?(
                //            PDHRegistrationDataParser.parseRegistrationData(data))
                //    } else {
                //        self.delegate?.didReceiveDataWithError?(
                //            PDHLoginDataParser.parseErrorObject(jsonData["Result"]))
                //    }
                //} else {
                //    self.delegate?.didReceiveDataWithError?(nil)
                //}
            }, failure: { (error) -> Void in
                print("\(error)")
                //self.delegate?.didFailWithError?(error.localizedDescription)
        })
    }
}