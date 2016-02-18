//
//  PDHDataManager.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import SwiftyJSON
import AFNetworking

class PDHDataManager {
    weak var delegate: PDHDataManagerProtocol?
    
    class func saveUserData(data: PDHLoginInfoDataObject) {
        NSUserDefaults.standardUserDefaults().setObject(
            NSKeyedArchiver.archivedDataWithRootObject(data),
            forKey: "LoginInfo")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func getUserData() -> PDHLoginInfoDataObject? {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("LoginInfo") as? NSData {
            var loginInfoDataObject: PDHLoginInfoDataObject!
            loginInfoDataObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! PDHLoginInfoDataObject
            
            return loginInfoDataObject
        }
        
        return nil
    }
    /*
    {"uid":"user_id","menu_id":"menu id", "quantity":"dish quantity","size":"1|2","price":"unit price"}
    */
   
    class func addDishToOrderCart(dish: PDHDishDataObject) {
        let paramsDict: [String: AnyObject] =
            ["uid": getUserData()!.email,
            "menu_id": dish.id,
            "quantity": dish.halfQuantity,
            "size": "\(dish.halfQuantity)",
            "price": dish.halfPrice]
   
        PDHNetworkManager.postRequesForURLWithJSON(PDHConstantURL.ADD_CART_ITEM,
            params: paramsDict,
            success: { (response) -> Void in
                print("Response is \(response)")
            }, failure: { (error) -> Void in
                print("Error is \(error)")
        })
    }
}