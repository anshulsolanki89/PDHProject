//
//  PDHViewActionProtocol.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

protocol ViewActionDelegate: class {
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?)
}
