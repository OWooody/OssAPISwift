//
//  OssAPI.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/14/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

/// The APISingleton class has the api instance that will be used across the system, the class uses the singleton design pattern to hold only one object.
class APISingleton {
    
    /// Initialize the alamofire request manager.
    var manager = Alamofire.Manager.sharedInstance
    
    /// Make the constructor private to prevent creating objects.
    private init() {
        
        // Configure the alamofire manager with some customization.
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = CONSTANTS.Backend.TIME_OUT // Set the max timeout time.
        configuration.timeoutIntervalForRequest = CONSTANTS.Backend.TIME_OUT // Set the max timeout time.
        self.manager = Alamofire.Manager(configuration: configuration)
    }
    
    /// Create the singleton object.
    static let sharedInstance = APISingleton()
    
    /**
     Get the shared instance.
     - returns: The shared instance object.
     */
    static func getInstance() -> APISingleton {
        return sharedInstance
    }
    
    /**
     The prepareParams function converts the object passed in the parameter to the json string representation.
     - parameter object:The object that will be parsed into string json format.
     - returns: The json string dictionary.
     */
    static func prepareParameters(object: [Object]) -> [[String:AnyObject]] {
        return Mapper().toJSONArray(object)
    }
    
    /// Shorter header of the call method.
    func call(urlRequest: URLRequestConvertible, completionHandler: (AnyObject?, NSError?) -> ()) {
        call(urlRequest, canHandleErrorGlobally: true, completionHandler: completionHandler)
    }
    
    /**
     Make the call to the api server.
     - parameter urlRequest:The url construct that has all the call information.
     - parameter canHandleErrorGlobally:Decide wither the error should be handled the default way 'true' or the user wants to handle it 'false'.
     - parameter completionHandler:Void function that will complete the excecution of the app when the api server responds.
     */
    func call(urlRequest: URLRequestConvertible, canHandleErrorGlobally: Bool, completionHandler: (AnyObject?, NSError?) -> ()) {
        manager.request(urlRequest)
            .validate() // Automatically validate the data returned (type json and the response is between 200..299).
            .responseJSON { response in
                switch response.result {
                case .Success:
                    completionHandler(response.result.value, nil)
                case .Failure(let error):
                    
                    // Check if the user wants to handle the error globally (default) or not.
                    if(canHandleErrorGlobally == true) {
                        
                        // Check if there is a http status code or not.
                        if (response.response?.statusCode) != nil {
                            APIErrorHandler.handle(error, statusCode: (response.response?.statusCode)!) // Handle the error globally.
                        } else {
                            APIErrorHandler.handle(error, statusCode: error.code) // Handle the error globally.
                        }
                        
                    }
                    
                    completionHandler(nil, error)
                }
        }
    }
    
    
    
}

