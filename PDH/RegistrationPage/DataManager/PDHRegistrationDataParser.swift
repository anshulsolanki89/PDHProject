//
//  PDHRegistrationDataParser.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation

class PDHRegistrationDataParser: PDHDataParser {
    class func parseRegistrationData(data: [String: AnyObject]) -> PDHLoginInfoDataObject {
        let loginInfoDataObject = PDHLoginInfoDataObject()
        loginInfoDataObject.name =  data["name"] as! String
        loginInfoDataObject.email = data["email"] as! String
        loginInfoDataObject.mobile = data["mobile"] as! String
        
        return loginInfoDataObject
    }
}