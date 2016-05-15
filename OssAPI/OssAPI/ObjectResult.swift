//
//  ObjectResult.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/16/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ObjectResult: Mappable {
    
    /// Define the generic model.
    //var result: T?
    
    init?(_ map: Map)
    
    /// Map the generic model to a specific object.
    func mapping(map: Map)
}