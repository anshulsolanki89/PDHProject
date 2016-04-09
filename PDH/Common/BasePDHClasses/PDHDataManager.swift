//
//  PDHDataManager.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
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
}