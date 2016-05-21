//
//  PDHCurrentOrderDataParser.swift
//  PDH
//
//  Created by Ellan Jesse on 4/10/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHCurrentOrderDataParser: PDHDataParser {
    class func getCurrenOrderDishes(data: JSON) -> [PDHCurrentOrderDataObject] {
        var currentOrderDishes = [PDHCurrentOrderDataObject]()
        for var i = 0; i < data.count; i++ {
            let dish = PDHCurrentOrderDataObject()
            dish.dishId = String(data[i]["Id"].number)
            dish.dishMenuId = String(data[i]["MenuId"].number)
            dish.dishMenuTitle = data[i]["MenuTitle"].string
            dish.dishQuantity = data[i]["Quantity"].string
            dish.dishSize = data[i]["Size"].string
            dish.dishPrice = data[i]["Price"].string
            dish.dishImageURL = data[i]["Image"].string

            currentOrderDishes.append(dish)
        }

        return currentOrderDishes
    }
}