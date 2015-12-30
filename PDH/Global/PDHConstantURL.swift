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
}
