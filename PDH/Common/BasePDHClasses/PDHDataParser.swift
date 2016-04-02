//
//  PDHDataParser.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHDataParser {
    class func parseErrorObject(jsonData: JSON) -> PDHErrorObject {
        let loginErrorObject = PDHErrorObject()
        loginErrorObject.errorMessage = jsonData["ErrorMsg"].string
        return loginErrorObject
    }
}