//
//  ErrorTypes.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/14/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation

/// Define the errors that may occur when manipulating the data returned from the data source (most of them are http code requests).
enum APIStatusCode: Int {
    
    case BadRequest = 400       // The server cannot or will not process the request due to an apparent client error.
    case Unauthorized = 401     // The user is not authenticated to request the resource.
    case Forbidden = 403        // The request is valid but the server refused to respond.
    case PageNotFound = 404     // The requested resource could not be found.
    case MethodNotAllowed = 405 // A request method is not supported for the requested resource.
    case ServerError = 500      // Unexpected condition occured while the server was handling the request.
    case ServiceUnavailable=503 // The server is currently unavailable (e.g maintenance or overloaded).
    case Timeout = -1001        // The server timed out.
    
}

enum APIError: ErrorType {
    case ConnectionError(NSError)
    case InvalidResponse(AnyObject?)
    case ParseError(AnyObject?)
}

/// The AccountError defines the errors that may occur when the user enters any account or user information.
///
/// - InvalidPhone: The user phone number is invalid (either empty or not complete).
/// - InvalidPassword: The user password is invalid (e.g less than x characters).
enum AccountError: ErrorType {
    case InvalidPhone
    case InvalidPassword
}