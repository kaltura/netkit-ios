//
//  OTTDrmPlaybackPluginData.swift
//  Pods
//
//  Created by Rivka Peleg on 05/03/2017.
//
//

import Foundation
import SwiftyJSON

public class OTTDrmData: OTTBaseObject {

    public var scheme: String
    public var licenseURL: String
    public var certificate: String?

    public required init?(json: Any) {
        let jsonObject = JSON(json)

        guard  let scheme = jsonObject["scheme"].string,
               let licenseURL = jsonObject["licenseURL"].string
        else {
            return nil
        }

        self.scheme = scheme
        self.licenseURL = licenseURL
        self.certificate = jsonObject["certificate"].string
    }
}
