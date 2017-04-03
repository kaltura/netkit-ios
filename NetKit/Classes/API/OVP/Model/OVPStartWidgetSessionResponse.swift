//
//  OVPStartWidgetSessionResponse.swift
//  Pods
//
//  Created by Rivka Peleg on 30/12/2016.
//
//

import UIKit
import SwiftyJSON


public class OVPStartWidgetSessionResponse: OVPBaseObject {

    public let ks: String
    private let ksKey = "ks"
    
    public required init?(json:Any){
        let json = JSON(json)
        if let ks = json[self.ksKey].string {
            self.ks = ks
        }else{
            return nil
        }
    }

}
