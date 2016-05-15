//
//  SalonTestRoute.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import Alamofire

/// Define the base api server url.
let baseApiUrl = BackendCONSTANTS.API_URL

/// Define the user authentication token.
var OAuthToken: String?

/// This class handles all api requests.
enum Router<T where T: ObjectRouter>: URLRequestConvertible {
    
    // Define the methods the api server accepts.
    case CreateObject(T, [String: AnyObject])
    case ReadObject(T, String)
    case ReadAllObjects(T)
    case UpdateObject(T, String, [String: AnyObject])
    case DestroyObject(T, String)
    
    /// Define the method type (e.g Get, POST).
    /// - returns: The request method type.
    var method: Alamofire.Method {
        switch self {
        case .CreateObject:
            return .POST
        case .ReadObject:
            return .GET
        case .ReadAllObjects:
            return .GET
        case .UpdateObject:
            return .PUT
        case .DestroyObject:
            return .DELETE
        }
    }
    
    /// Define the request path.
    /// - returns: The path to the method.
    var path: String {
        switch self {
        case .CreateObject(let object, _):
            return object.createObjectPath()
        case .ReadObject(let object, let identifier):
            return object.readObjectPath(identifier)
        case .ReadAllObjects(let object):
            return object.readAllObjectsPath()
        case .UpdateObject(let object, let identifier, _):
            return object.updateObjectPath(identifier)
        case.DestroyObject(let object, let identifier):
            return object.destroyObjectPath(identifier)
        }
    }
    
    /// TODO: Define later.
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: baseApiUrl)!
        
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue

        if let token = OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .CreateObject(_, let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateObject(_, _, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}


