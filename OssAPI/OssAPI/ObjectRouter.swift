//
//  RouterObject.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/13/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import Foundation

/// This protocol defines the methods for communicating with an api.
/// - The identifier is the id or what identifies (e.g username, email, etc..) an object in the database.
protocol ObjectRouter {

    func createObjectPath() -> String
    func readObjectPath(identifier: String) -> String
    func readAllObjectsPath() -> String
    func updateObjectPath(identifier: String) -> String
    func destroyObjectPath(identifier: String) -> String
    
}
