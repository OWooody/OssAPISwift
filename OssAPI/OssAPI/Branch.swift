//
//  Branch.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

class Branch: Object {
    
    var name: String!
    
    override func mapping(map: Map) {
        self.name <- map["BranchName"]
    }
    
}
