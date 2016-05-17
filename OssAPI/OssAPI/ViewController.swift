//
//  ViewController.swift
//  OssAPI
//
//  Created by Osama Al-Najjar on 5/11/16.
//  Copyright © 2016 Osama Al-Najjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let api = APISingleton.getInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TEST THE API.
//        let URLRequest = Router.ReadAllObjects(SalonService())
//        api.call(URLRequest, object: Salon.self, canHandleErrorGlobally: true, retryCount: 3) { object, error in
//            let salon: Salon = object[0]
//            log.info(salon.geoLocation)
//            log.error(error)
//        }
        var salon = Salon(website: "aj.io", branches: [], description: "It worked Wk!", name: "Ali", admin: "Admin", geoLocation: "Location", phoneNumber: ["123"])
        
        let params = api.prepareParameters(salon)
        //["ID": "1", "SalonName": "Name", "PhoneNumber": ["123"], "Description": "Description", "SalonAdmin": "Admin", "Website": "testWebsite", "GeoLocation": "Location"]
        let URLRequest = Router.CreateObject(SalonService(), params)
        api.call(URLRequest, object: Salon.self) { response, error in
            log.info(response)
            log.error(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

