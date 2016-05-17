//
//  TestSalon.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

class Salon: Object {
    
    var website: String!
    var branches: [Branch]!
    var description: String!
    var name: String!
    var admin: String!
    var geoLocation: String!
    var phoneNumber: [String]!
    
    init(website: String, branches: [Branch], description: String, name: String, admin: String, geoLocation: String, phoneNumber: [String]) {
        super.init()
        self.website = website
        self.branches = nil
        self.description = description
        self.name = name
        self.admin = admin
        self.geoLocation = geoLocation
        self.phoneNumber = phoneNumber
    }
    
    required init?(_ map: Map) {
        fatalError("init has not been implemented")
    }
    
    override func mapping(map: Map) {
        self.website   <- map["Website"]
        self.branches  <- map["Branches"]
        self.description <- map["Description"]
        self.name <- map["SalonName"]
        self.admin <- map["SalonAdmin"]
        self.geoLocation <- map["GeoLocation"]
        self.phoneNumber <- map["PhoneNumber"]
    }
}