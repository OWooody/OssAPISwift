//
//  APIErrorHandler.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/14/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation

class APIErrorHandler: ErrorHandler {
    
    static func handle(error: NSError, statusCode: Int) {
        
        switch statusCode {
        case APIStatusCode.Timeout.rawValue:
            log.error("Timeout")
        case APIStatusCode.PageNotFound.rawValue:
            log.error("Page Not Found")
        default:
            log.error(statusCode)
        }
    }
}