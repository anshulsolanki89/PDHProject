//
//  PDHViewActionProtocol.swift
//  PDH
//
//  Created by Ellan Jesse on 11/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

protocol ViewActionDelegate: class {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?)
}
