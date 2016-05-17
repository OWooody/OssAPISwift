//
//  APIErrorHandler.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/14/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation

class APIErrorHandler: ErrorHandler {
    
    static func handle(error: ErrorType) {
        
        switch error {
        case APIError.ParseError:
            log.error("Parse Error")
        default:
            log.error("Handler: \(error)")
        }
    }
}