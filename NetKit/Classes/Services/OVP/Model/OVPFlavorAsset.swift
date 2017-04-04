//
//  FlavorAsset.swift
//  Pods
//
//  Created by Rivka Peleg on 28/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OVPFlavorAsset: OVPBaseObject {

    
    
    public var id: String
    public var tags: String?
    public var fileExt: String?
    public var paramsId: Int
    
    let idKey = "id"
    let tagsKey = "tags"
    let fileExtKey = "fileExt"
    let paramsIdKey = "flavorParamsId"
    
    public required init?(json: Any) {
     
        let jsonObject = JSON(json)
        if let id = jsonObject[idKey].string, let paramID = jsonObject[paramsIdKey].int {
            self.id = id
            self.paramsId = paramID
            
        }else{
            return nil
        }
        
        
        self.tags = jsonObject[tagsKey].string
        self.fileExt = jsonObject[fileExtKey].string
        
        
    }
}
