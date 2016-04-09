//
//  PDHOrderCart.swift
//  PDH
//
//  Created by Ellan Jesse on 1/1/16.
//  Copyright © 2016 Ellan Jesse. All rights reserved.
//

import Foundation

class PDHOrderCart {
    static let pdhCart = PDHOrderCart()
    
    private var orderedDishes = [PDHDishDataObject]()
    private var orderCartManager = PDHOrderCartManager()

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
            addDishToCart(dish)
        } else if orderedDishes.contains(dish) && ((dish.halfQuantity + dish.fullQuantity) == 0){
            orderedDishes.removeAtIndex(orderedDishes.indexOf(dish)!)
            editDishFromCart(dish)
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

// MARK:- Private
extension PDHOrderCart {
    private func addDishToCart(dish: PDHDishDataObject) {
        if dish.fullQuantity > 0 {
            let dish =
                ["uid" : PDHDataManager.getUserData()!.email,
                "menu_id" : dish.id,
                "quantity" : dish.fullQuantity,
                "size" : "1",
                "price" : dish.fullPrice]
            orderCartManager.addItemToCart(dish as! [String : AnyObject])
        }

        if dish.halfQuantity > 0 {
            let dish =
                ["uid" : PDHDataManager.getUserData()!.email,
                "menu_id" : dish.id,
                "quantity" : dish.halfQuantity,
                "size" : "1",
                "price" : dish.halfPrice]
            orderCartManager.addItemToCart(dish as! [String : AnyObject])
        }
    }

    private func editDishFromCart(dish: PDHDishDataObject) {
        let fullDish =
            ["uid" : PDHDataManager.getUserData()!.email,
            "menu_id" : dish.id,
            "quantity" : dish.fullQuantity,
            "size" : "1",
            "price" : dish.fullPrice]
        orderCartManager.editItemInCart(fullDish as! [String : AnyObject])

        let halfDish =
            ["uid" : PDHDataManager.getUserData()!.email,
            "menu_id" : dish.id,
            "quantity" : dish.halfQuantity,
            "size" : "1",
            "price" : dish.halfPrice]
        orderCartManager.editItemInCart(halfDish as! [String : AnyObject])
    }
}