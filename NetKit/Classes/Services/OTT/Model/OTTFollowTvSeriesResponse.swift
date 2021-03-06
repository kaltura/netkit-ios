//
//  OTTFollowTvSeriesResponse.swift
//  Pods
//
//  Created by Vadim Ratchkov on 21/05/2017.
//
//

import UIKit
import SwiftyJSON

public class OTTFollowTvSeriesResponse: OTTBaseObject{
    public var assetId: Int
    
    public required init?(json:Any) {
        assetId = -1
        let jsonObject = JSON(json)
        guard let assetId = jsonObject["assetId"].int
            else {
                return nil
        }
        self.assetId = assetId
    }
}

