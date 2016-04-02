//
//  PDHMenuDataParser.swift
//  PDH
//
//  Created by Ellan Jesse on 12/29/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHMenuDataParser: PDHDataParser {
  
    class func getDishOfWeekModel(data: JSON) -> PDHDishOfWeekDataObject {
        let dishOfWeekModel = PDHDishOfWeekDataObject()
        dishOfWeekModel.title = data[0]["Title"].string
        dishOfWeekModel.dishType = data[0]["DishType"].string
        dishOfWeekModel.fullPrice = String(data[0]["FullPrice"].number!)
        dishOfWeekModel.halfPrice = String(data[0]["HalfPrice"].number!)
        dishOfWeekModel.dishImageURL = data[0]["Image"].string
        dishOfWeekModel.id = String(data[0]["Id"].number!)

        return dishOfWeekModel
    }
    
    class func getRetstaurantMenu(data: JSON) -> [PDHDishcategoryMenu] {
        var dishMenuArray = [PDHDishcategoryMenu]()
      
        for var i = 0; i < data.count; i++ {
            let dishMenu = PDHDishcategoryMenu()
            dishMenu.dishCategory = data[i]["Name"].string
            dishMenu.categoryImageURL =  data[i]["Image"].string
            dishMenu.menuId = data[i]["Id"].string
            dishMenuArray.append(dishMenu)
        }
        
        return dishMenuArray
    }
    
    class func getVegDishMenu(data: JSON) -> [PDHVegDishDataObject] {
        var dishesArray = [PDHVegDishDataObject]()
        
        for var i = 0; i < data.count; i++ {
            if NSComparisonResult.OrderedSame == data[i]["DishType"].string!.caseInsensitiveCompare("veg") {
                let dish = PDHVegDishDataObject()
                dish.title = data[i]["Title"].string
                    dish.dishType = data[i]["DishType"].string
                dish.fullPrice = String(data[i]["FullPrice"].number!)
                dish.halfPrice = String(data[i]["HalfPrice"].number!)
                dish.dishImageURL = data[i]["Image"].string
                dish.id = String(data[i]["Id"].number!)
                dishesArray.append(dish)
            }
        }
        
        return dishesArray
    }

    class func getNonVegDishMenu(data: JSON) -> [PDHNonVegDishDataObject] {
        var dishesArray = [PDHNonVegDishDataObject]()

        for var i = 0; i < data.count; i++ {
            if NSComparisonResult.OrderedSame != data[i]["DishType"].string!.caseInsensitiveCompare("veg") {
                let dish = PDHNonVegDishDataObject()
                dish.title = data[i]["Title"].string
                dish.dishType = data[i]["DishType"].string
                dish.fullPrice = String(data[i]["FullPrice"].number!)
                dish.halfPrice = String(data[i]["HalfPrice"].number!)
                dish.dishImageURL = data[i]["Image"].string
                dish.id = String(data[i]["Id"].number!)
                dishesArray.append(dish)
            }
        }

        return dishesArray
    }

}