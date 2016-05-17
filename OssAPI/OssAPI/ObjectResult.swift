//
//  ObjectResult.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/16/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ObjectResult {
    
    func parse<T: Result<T>>(data: AnyObject) -> T
    
}