//
//  PDHLoginInfoDataObject.swift
//  PDH
//
//  Created by Ellan Jesse on 12/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation

class PDHLoginInfoDataObject: NSObject, NSCoding {
    var name: String!
    var mobile: String!
    var email: String!
//    var userImage: UIImage?
    var uid: String! = "3"
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        mobile = aDecoder.decodeObjectForKey("Mobile") as! String
        email = aDecoder.decodeObjectForKey("Email") as! String
        uid = aDecoder.decodeObjectForKey("Uid") as! String
//        userImage = aDecoder.decodeObjectForKey("Image") as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(mobile, forKey: "Mobile")
        aCoder.encodeObject(email, forKey: "Email")
        aCoder.encodeObject(uid, forKey: "Uid")
//        aCoder.encodeObject(userImage, forKey: "Image")
    }
}