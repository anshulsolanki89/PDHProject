//
//  PDHAddressDataParser.swift
//  PDH
//
//  Created by Anshul Solanki on 4/3/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHAddressDataParser: PDHDataParser {
    class func parseUserAddressData(data: [JSON]) -> [PDHUserAddressDataObject] {
        var userAddresses = [PDHUserAddressDataObject]()
        for everyUserAddress in data {
            let userAddress = PDHUserAddressDataObject()
            userAddress.name = everyUserAddress["Name"].stringValue
            userAddress.address = everyUserAddress["Address"].stringValue
            userAddress.locality = everyUserAddress["Locality"].stringValue
            userAddress.mobile = everyUserAddress["Mobile"].stringValue
            userAddress.pincode = everyUserAddress["Pincode"].stringValue

            userAddresses.append(userAddress)
        }
        return userAddresses
    }
}