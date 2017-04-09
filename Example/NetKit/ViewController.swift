//
//  ViewController.swift
//  NetKit
//
//  Created by srivkas@gmail.com on 04/02/2017.
//  Copyright (c) 2017 srivkas@gmail.com. All rights reserved.
//

import UIKit
import KalturaNetKit

class ViewController: UIViewController {

    let serverURL = "https://api-preprod.ott.kaltura.com/v4_2/api_v3/"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.singleRequestExample()
        self.multiRequestExample()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func singleRequestExample() {
        
        // ------ example for single request: ( login ) ------
        let requestBuilder = OTTUserService.login(baseURL: serverURL, partnerId: 198, username: "netkitExample@mailinator.com", password: "123456")
        requestBuilder?.set(completion: { (response) in
            guard response.data != nil else {
                return
            }
            
            //do somthing with data
        })
        
        //trying to build a request for login
        guard let request = requestBuilder?.build() else {
            //unable to create request
            return
        }
        
        USRExecutor.shared.send(request: request)

    }
    
    
    
    func multiRequestExample() {
        
        let loginRB = OTTUserService.login(baseURL: serverURL, partnerId: 198, username: "netkitExample@mailinator.com", password: "123456")
        let getSessionRB = OTTSessionService.get(baseURL: serverURL, ks: "{1:result:loginSession:ks}")
        
        guard let req1 = loginRB, let req2 = getSessionRB else { return }
        guard let mrb = KalturaMultiRequestBuilder(url: serverURL)?
            .add(request: req1)
            .add(request: req2) else { return }
        
        mrb.set { (response) in
            
            // response of multi request is an array of responses
            guard response.data != nil else {
                return
            }
            
            //do somthing with data

        }
        
        let request = mrb.build()
        USRExecutor.shared.send(request: request)
    }

}

