//
//  PDHLoginInfoDataObject.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation

class PDHLoginInfoDataObject: NSObject, NSCoding {
    var name: String!
    var mobile: String!
    var email: String!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        mobile = aDecoder.decodeObjectForKey("Mobile") as! String
        email = aDecoder.decodeObjectForKey("Email") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(mobile, forKey: "Mobile")
        aCoder.encodeObject(    email, forKey: "Email")
    }
}