//
//  SalonService.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

class SalonService: ObjectRouter {
    
    let controllerName = "Salon"
    
    /// This method provides the data returned from the data source (e.g api) as an object array .
    /// - parameter data:The data returned from the data source.
//    static func parse(data: AnyObject) -> [Salon] {
//        return Mapper<Salon>().mapArray(data)!
//    }
    
//    func parse<T : Result<Salon>>(data: AnyObject) -> Salon {
//        return Mapper<Salon>().map(data)!
//    }
    
    func createObjectPath() -> String {
        return ""
    }
    
    func readObjectPath(identifier: String) -> String {
        return "salon"
    }
    
    func readAllObjectsPath() -> String {
        return "salonss"
    }
    
    func updateObjectPath(identifier: String) -> String {
        return ""
    }
    
    func destroyObjectPath(identifier: String) -> String {
        return ""
    }
}