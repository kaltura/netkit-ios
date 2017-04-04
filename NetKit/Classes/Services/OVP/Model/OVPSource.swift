//
//  ...swift
//  Pods
//
//  Created by Rivka Peleg on 29/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OVPSource: OVPBaseObject {
    
    public var deliveryProfileId: Int64
    public var format: String
    public var protocols: [String]?
    public var flavors: [String]?
    public var url: URL?
    public var drm: [OVPDRM]?
    
    
    let deliveryProfileIdKey = "deliveryProfileId"
    let formatKey = "format"
    let protocolsKey = "protocols"
    let flavorsKey = "flavorIds"
    let urlKey = "url"
    let drmKey = "drm"
    
    
    public required init?(json: Any) {
        
        let jsonObject = JSON(json)
        
        guard let id =  jsonObject[deliveryProfileIdKey].int64,
            let format = jsonObject[formatKey].string
            else {
                return nil
        }
        
        self.deliveryProfileId = id
        self.format = format
        if let protocols = jsonObject[protocolsKey].string{
            self.protocols = protocols.components(separatedBy: ",")
        }
        
        if let flavors = jsonObject[flavorsKey].string {
            self.flavors = flavors.components(separatedBy: ",")
        }
        
        if let url = jsonObject[urlKey].url{
            self.url = url
        }
        
        if let drmArray = jsonObject[drmKey].array{
            
            var drmObjects: [OVPDRM] = [OVPDRM]()
            for drmJSON in drmArray{
                if let object = OVPDRM(json: drmJSON.object){
                    drmObjects.append(object)
                }
                
            }
            self.drm = drmObjects
        }
        
    }
    
}
