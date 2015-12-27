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
    
    func saveUserData(data: PDHLoginInfoDataObject) {
        NSUserDefaults.standardUserDefaults().setObject(
            NSKeyedArchiver.archivedDataWithRootObject(data),
            forKey: "LoginInfo")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}