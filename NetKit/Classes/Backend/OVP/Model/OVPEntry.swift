
//
//  OVPEntry.swift
//  Pods
//
//  Created by Rivka Peleg on 28/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OVPEntry: OVPBaseObject {
    
    public var id: String
    public var dataURL: URL?
    public var mediaType: Int?
    public var flavorParamsIds: String?
    public var duration: TimeInterval = 0
    public var name: String?
    public var type: Int?
    
    
    let idKey = "id"
    let dataURLKey = "dataUrl"
    let mediaTypeKey = "mediaType"
    let flavorParamsIdsKey = "flavorParamsIds"
    let durationKey = "duration"
    let nameKey = "name"
    let typeKey = "type"
    
    public required init?(json: Any) {
        
        let jsonObject = JSON(json)
        guard let id = jsonObject[idKey].string else {
            return nil
        }
        
        self.id = id
        
        if let url = jsonObject[dataURLKey].string{
            let dataURL = URL(string: url)
            self.dataURL = dataURL
            
        }
        
        self.mediaType = jsonObject[mediaTypeKey].int
        self.flavorParamsIds = jsonObject[flavorParamsIdsKey].string
        self.duration = jsonObject[durationKey].double ?? 0
        self.name = jsonObject[nameKey].string
        self.type = jsonObject[typeKey].int
        
    }
}
