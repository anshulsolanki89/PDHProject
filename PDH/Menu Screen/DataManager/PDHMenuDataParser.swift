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
  
    class func getDishOfWeekModel(data: JSON) -> PDHDishOfWeekDataModel {
        let dishOfWeekModel = PDHDishOfWeekDataModel()
        dishOfWeekModel.title = data[0]["Title"].string
        dishOfWeekModel.dishType = data[0]["DishType"].string
        dishOfWeekModel.fullPrice = String(data[0]["FullPrice"].number)
        dishOfWeekModel.halfPrice = String(data[0]["HalfPrice"].number)
        dishOfWeekModel.dishImageURL = data[0]["Image"].string
        return dishOfWeekModel
    }
}