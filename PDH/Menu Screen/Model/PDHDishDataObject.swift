//
//  PDHDishDataObject.swift
//  PDH
//
//  Created by Ellan Jesse on 12/29/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//
import Foundation

class PDHDishDataObject: NSObject {
    var title: String!
    var halfPrice: String!
    var fullPrice: String!
    var dishType: String!
    var dishImageURL: String!
    var dishOfWeek: String!
    var id: String!
    var halfQuantity = 0
    var fullQuantity = 0
}