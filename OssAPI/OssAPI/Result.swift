//
//  ObjectResponseSerializable.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/15/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

class Result<T: ObjectResult>: Mappable {
    
    /// Define the generic model.
    var result: T?
    
    required init?(_ map: Map) {}
    
    /// Map the generic model to a specific object.
    func mapping(map: Map) {
        self.result <- map["ID"]
    }

}