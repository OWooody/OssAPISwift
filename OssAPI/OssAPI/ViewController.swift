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
        let URLRequest = Router.ReadAllObjects(SalonService())
        api.call(URLRequest) { data, error in
            
            //log.info(data)
            //let salon = SalonService.parse(data!)
            //print(salon[0].branches)
            log.error(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

