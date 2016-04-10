//
//  PDHCurrentOrderDataManager.swift
//  PDH
//
//  Created by Anshul Solanki on 4/10/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHCurrentOrderDataManager: PDHDataManager {
    func getDishesFromCart(data: [String: AnyObject]) {
        PDHNetworkManager.getRequestForURL(PDHConstantURL.GET_CART_ITEM,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHCurrentOrderDataParser.getCurrenOrderDishes(jsonData["Result"]["Record"]))
                    } else {
                        self.delegate?.didReceiveDataWithError?(
                            PDHCurrentOrderDataParser.parseErrorObject(jsonData["Result"]))
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