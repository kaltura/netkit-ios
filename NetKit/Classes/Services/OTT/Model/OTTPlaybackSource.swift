//
//  OTTPlaybackSource.swift
//  Pods
//
//  Created by Rivka Peleg on 05/03/2017.
//
//

import Foundation
import SwiftyJSON

public class OTTPlaybackSource: OTTBaseObject {

    public var assetId: Int
    public var id: Int
    public var type: String // file format
    public var url: URL?
    public var duration: Float
    public var externalId: String?
    public var protocols: [String]
    public var format: String
    public var drm: [OTTDrmData]?
    public var adsPolicy: String? = nil
    public var adsParam: String? = nil

    public required init?(json: Any) {
        let jsonObject = JSON(json)

        guard let assetId = jsonObject["assetId"].int,
        let id = jsonObject["id"].int,
        let type = jsonObject["type"].string,
        let urlString = jsonObject["url"].string,
        let protocolsString = jsonObject["protocols"].string,
        let format = jsonObject["format"].string
        else {
            return nil
        }

        self.assetId = assetId
        self.id = id
        self.type = type
        self.url = URL.init(string: urlString)
        self.protocols = protocolsString.components(separatedBy: ",")
        self.format = format
        self.duration = jsonObject["duration"].float ?? 0
        self.externalId = jsonObject["externalId"].string
        self.adsPolicy = jsonObject["adsPolicy"].string
        self.adsParam = jsonObject["adsParam"].string

        var drmArray = [OTTDrmData]()
        jsonObject["drm"].array?.forEach {(json) in
            if let drmObject = OTTDrmData(json: json.object) {
                drmArray.append(drmObject)
            }
        }

        if drmArray.count > 0 {
            self.drm = drmArray
        }

    }
}
