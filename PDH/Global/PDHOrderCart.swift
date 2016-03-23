//
//  PDHOrderCart.swift
//  PDH
//
//  Created by Anshul Solanki on 1/1/16.
//  Copyright © 2016 Anshul Solanki. All rights reserved.
//

import Foundation

class PDHOrderCart {
    static let pdhCart = PDHOrderCart()
    
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
        if !orderedDishes.contains(dish) && ((dish.halfQuantity + dish.fullQuantity) > 0) {
            orderedDishes.append(dish)
        } else if orderedDishes.contains(dish) && ((dish.halfQuantity + dish.fullQuantity) == 0){
            orderedDishes.removeAtIndex(orderedDishes.indexOf(dish)!)
        }
    }

    func totalPrice() -> Int {
        var totalPrice = 0
        for eachDish in orderedDishes {
            totalPrice += (eachDish.halfQuantity * Int(eachDish.halfPrice)!)
            totalPrice += (eachDish.fullQuantity * Int(eachDish.fullPrice)!)
        }
        return totalPrice
    }

    func totalDishes() -> Int {
        var totalDishes = 0
        for eachDish in orderedDishes {
            totalDishes += eachDish.halfQuantity
            totalDishes += eachDish.fullQuantity
        }
        return totalDishes
    }

}