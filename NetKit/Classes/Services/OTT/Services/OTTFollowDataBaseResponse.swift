//
//  OTTFollowDataBaseResponse.swift
//  Pods
//
//  Created by Vadim Ratchkov on 21/05/2017.
//
//

import UIKit
import SwiftyJSON

public class OTTFollowDataBaseResponse: OTTBaseObject {
    internal var status: Int
    internal var title: String
    internal var followPhrase: String
    internal var announcementId: Int64
    internal var timestamp: Int64
    
    public required init?(json:Any) {
        let jsonObject = JSON(json)
        
        guard let status = jsonObject["status"].int,
            let title = jsonObject["title"].string,
            let followPhrase = jsonObject["followPhrase"].string,
            let announcementId = jsonObject["announcementId"].int64,
            let timestamp = jsonObject["timestamp"].int64
        else {
            return nil
        }
                
        self.status = status
        self.title = title
        self.followPhrase = followPhrase
        self.announcementId = announcementId
        self.timestamp = timestamp
    }
}

