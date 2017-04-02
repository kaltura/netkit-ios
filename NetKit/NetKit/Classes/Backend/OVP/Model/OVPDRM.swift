//
//  OVPDRM.swift
//  Pods
//
//  Created by Rivka Peleg on 29/11/2016.
//
//

import UIKit
import SwiftyJSON


public class OVPDRM: OVPBaseObject {

    public var scheme: String?
    public var licenseURL: String?
    public var certificate: String?
    
    private let schemeKey = "scheme"
    private let licenseURLKey = "licenseURL"
    private let certificateKey = "certificate"
    
    public required init?(json: Any) {
        
        let jsonObject = JSON(json)
        self.scheme = jsonObject[schemeKey].string
        self.licenseURL = jsonObject[licenseURLKey].string
        self.certificate = jsonObject[certificateKey].string
    
    }
}
