//
//  PDHMenuDataManager.swift
//  PDH
//
//  Created by Anshul Solanki on 12/29/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHMenuDataManager: PDHDataManager {
    
    func getDishOfWeek() {
        PDHNetworkManager.getRequestForURL(PDHConstantURL.DISH_OF_WEEK_URL,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHMenuDataParser.getDishOfWeekModel(jsonData["Result"]["Record"]))
                    } else {
                        self.delegate?.didReceiveDataWithError?(
                            PDHMenuDataParser.parseErrorObject(jsonData["Result"]))
                    }
                } else {
                    self.delegate?.didReceiveDataWithError?(nil)
                }
            }, failure: { (error) -> Void in
                print("\(error)")
                self.delegate?.didFailWithError?(error.localizedDescription)
        })
    }
    
    func getRestaurantMenu() {
        PDHNetworkManager.getRequestForURL(PDHConstantURL.CATEGORY_LIST_URL,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHMenuDataParser.getRetstaurantMenu(jsonData["Result"]["Record"]))
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
    
    func getDishMenu() {
        PDHNetworkManager.getRequestForURL(PDHConstantURL.MENU_LIST_URL,
            success: { (response) -> Void in
                print("\(response)")
                if let response = response {
                    let jsonData = JSON(response)
                    if jsonData["Result"]["ErrorCode"].numberValue == 0 {
                        self.delegate?.didReceiveDataWithSuccess?(
                            PDHMenuDataParser.getDishMenu(jsonData["Result"]["Record"]))
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