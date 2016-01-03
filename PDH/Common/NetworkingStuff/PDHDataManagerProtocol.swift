//
//  PDHDataManagerProtocol.swift
//  PDH
//
//  Created by Anshul Solanki on 12/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation

@objc protocol PDHDataManagerProtocol {
    optional func didReceiveDataWithSuccess(response: AnyObject)
    // TODO:- Make project specific error and error codes
    // Data is optional as response is empty sometimes from server
    optional func didReceiveDataWithError(response: AnyObject?)
    optional func didFailWithError(error: String)
}