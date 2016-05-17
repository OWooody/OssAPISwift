//
//  ErrorHandler.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/14/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation

/// Define a protocol that handles errors globally.
protocol ErrorHandler {
    
    /// Handle any type of NSError across the app.
    /// - parameter error:The error object.
    static func handle(error: ErrorType)
}