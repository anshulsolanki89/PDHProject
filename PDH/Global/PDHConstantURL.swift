    //
//  PDHConstantURL.swift
//  PDH
//
//  Created by Anshul Solanki on 12/26/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

struct PDHConstantURL {
    private init() {
    }
    
    static let LOGIN_URL = "http://bemisaal.in/restAppNew/api/siteUsers/login.json"
    static let REGISTRATION_URL = "http://bemisaal.in/restAppNew/api/siteUsers/registeration.json"
    static let CATEGORY_LIST_URL = "http://bemisaal.in/restAppNew/api/category/get.json"
    static let MENU_LIST_URL = "http://bemisaal.in/restAppNew/api/menu/get.json"
    static let DISH_OF_WEEK_URL = "http://bemisaal.in/restAppNew/api/menu/get.json?is_week_dish=1"
    
    //static let ADD_CART_ITEM = "http://bemisaal.in/cakephp3/api/cart/add.json"
    static let ADD_CART_ITEM = "http://bemisaal.in/restAppNew/api/cart/add.json"
    /*
    {"uid":"user_id","menu_id":"menu id", "quantity":"dish quantity","size":"1|2","price":"unit price"}
    */
    //static let EDIT_CART_ITEM = "http://bemisaal.in/cakephp3/api/cart/edit.json"
    static let EDIT_CART_ITEM = "http://bemisaal.in/restAppNew/api/cart/edit.json"
    /*
    {"uid":"user_id","menu_id":"menu id","":"cart id", "quantity":"dish quantity","size":"1|2","price":"unit price"}
    */
    //static let GET_CART_ITEM = "http://bemisaal.in/cakephp3/api/cart/get.json"
    static let GET_CART_ITEM = "http://bemisaal.in/restAppNew/api/cart/get.json"
    /*
    {"uid":"user_id"}
    */
    static let PLACE_ORDER = "http://bemisaal.in/cakephp3/api/orders/add.json"
    /*
    {"uid":"user_id","total_price": "totalprice", "discount":"discounted Ammount","comment": "comment", "orders": [{"cart_id":"cart id","menu_id":"menu id", "quantity":"dish quantity","size":"1|2","price":"unit price"}]}
    */
}
