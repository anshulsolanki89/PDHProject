//
//  PDHOrderBasket.swift
//  PDH
//
//  Created by Anshul Solanki on 1/1/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation

class PDHOrderBasket {
    static let singleOrderBasket = PDHOrderBasket()
    
    var orderedDishes = [PDHDishDataObject]()
    
    private init() {}
    
    func checkDishExists(dishTitle: String) -> Bool {
        for eachDish in orderedDishes {
            if eachDish.title == dishTitle {
                return true
            }
        }
        
        return false
    }
    
    func addDishToOrder(dish: PDHDishDataObject) {
        orderedDishes.append(dish)
    }
}