//
//  PDHLoginDataParser.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHLoginDataParser: PDHDataParser {
    
    class func parseLoginObject(jsonData: JSON) -> PDHLoginInfoDataObject {
        let loginInfo = PDHLoginInfoDataObject()
        loginInfo.name = jsonData["Name"].string
        loginInfo.mobile = String(jsonData["Mobile"].number!)
        loginInfo.email = jsonData["Email"].string
        return loginInfo
    }
}