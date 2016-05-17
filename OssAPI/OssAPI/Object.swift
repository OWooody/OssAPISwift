//
//  Object.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

// TODO: Description.
class Object: Mappable {
    
    var id: String!
    
    init() {}
    
    required init?(_ map: Map) {}
    
    /// Map the model attributes to the json representation and vise versa.
    /// - parameter map:The mapping object defined by the 'ObjectMapper' library.
    func mapping(map: Map) {
        self.id <- map["ID"]
    }
    
}
