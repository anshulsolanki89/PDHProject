//
//  PDHMenuDataParser.swift
//  PDH
//
//  Created by Anshul Solanki on 12/29/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PDHMenuDataParser: PDHDataParser {
  
    class func getDishOfWeekModel(data: JSON) -> PDHDishDataObject {
        let dishOfWeekModel = PDHDishDataObject()
        dishOfWeekModel.title = data[0]["Title"].string
        dishOfWeekModel.dishType = data[0]["DishType"].string
        dishOfWeekModel.fullPrice = String(data[0]["FullPrice"].number!)
        dishOfWeekModel.halfPrice = String(data[0]["HalfPrice"].number!)
        dishOfWeekModel.dishImageURL = data[0]["Image"].string
        return dishOfWeekModel
    }
    
    class func getRetstaurantMenu(data: JSON) -> [PDHDishcategoryMenu] {
        var dishMenuArray = [PDHDishcategoryMenu]()
      
        for var i = 0; i < data.count; i++ {
            let dishMenu = PDHDishcategoryMenu()
            dishMenu.dishCategory = data[i]["Name"].string
            dishMenu.categoryImageURL =  data[i]["Image"].string
            
            dishMenuArray.append(dishMenu)
        }
        
        return dishMenuArray
    }
    
    class func getDishMenu(data: JSON) -> [PDHDishDataObject] {
        var dishesArray = [PDHDishDataObject]()
        
        for var i = 0; i < data.count; i++ {
            let dish = PDHDishDataObject()
            dish.title = data[i]["Title"].string
            dish.dishType = data[i]["DishType"].string
            dish.fullPrice = String(data[i]["FullPrice"].number)
            dish.halfPrice = String(data[i]["HalfPrice"].number)
            dish.dishImageURL = data[i]["Image"].string
            
            dishesArray.append(dish)
        }
        
        return dishesArray
    }
}