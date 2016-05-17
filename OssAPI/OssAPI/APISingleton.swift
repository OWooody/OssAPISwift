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
import ReactKit
import SwiftTask

/// The APISingleton class has the api instance that will be used across the system, the class uses the singleton design pattern to hold only one object.
class APISingleton {
    
    /// Create the singleton object.
    static let sharedInstance = APISingleton()
    
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
    func prepareParameters(object: Object) -> [String:AnyObject] {
        return Mapper().toJSON(object)
    }
    
    /// Shorter header of the call method.
    func call<T: Mappable>(urlRequest: URLRequestConvertible, object: T.Type, completionHandler: ([T], NSError?) -> ()) {
        call(urlRequest, object: object, canHandleErrorGlobally: true, retryCount: 1, completionHandler: completionHandler)
    }
    
    /**
     Make the call to the api server.
     - parameter urlRequest:The url construct that has all the call information.
     - parameter canHandleErrorGlobally:Decide wither the error should be handled the default way 'true' or the user wants to handle it 'false'.
     - parameter completionHandler:Void function that will complete the excecution of the app when the api server responds.
     */
    func call<T: Mappable>(urlRequest: URLRequestConvertible, object: T.Type, canHandleErrorGlobally: Bool, retryCount: Int, completionHandler: ([T], NSError?) -> ()) {
        
        // Define the react task to track the api call.
        self.manager.request(urlRequest)
            //.validate() // Automatically validate the data returned (type json and the response is between 200..299).
            .responseJSON { response in
                switch response.result {
                
                case .Success:
                    
                    var result: [T]
                    
                    if(urlRequest.URLRequest.HTTPMethod == Alamofire.Method.GET.rawValue) {
                        
                        // Parse the result value to the object type as an array.
                        if let _ = Mapper<T>().mapArray(response.result.value) {
                            result = Mapper<T>().mapArray(response.result.value)! // Parse succeeded.
                        } else {
                            result = []
                            APIErrorHandler.handle(APIError.ParseError(response.result.value)) // Parse error.
                        }
                    } else {
                        result = []
                    }
                    print(response)
                    // Return to the caller with the result.
                    completionHandler(result, nil)
                    
                case .Failure(let error):
                    //print(urlRequest.URLRequest.)
                    // Check if the user wants to handle the error globally (default) or not.
                    if(canHandleErrorGlobally == true) {
                        APIErrorHandler.handle(APIError.ConnectionError(error)) // Handle error globally.
                    }
                    
                    // Retry the api request and keep track of the retry count.
                    if(retryCount > 0) {
                        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
                        dispatch_after(delay, dispatch_get_main_queue()) {
                            self.call(urlRequest, object: object, canHandleErrorGlobally: canHandleErrorGlobally, retryCount: (retryCount-1), completionHandler: completionHandler)
                        }
                    } else {
                        completionHandler([], error) // Return to the caller with an error.
                    }
                
                }
        }
        
    }
    
    
    
}

