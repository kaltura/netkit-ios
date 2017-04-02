//
//  OTTPlaybackContext.swift
//  Pods
//
//  Created by Rivka Peleg on 05/03/2017.
//
//

import Foundation
import SwiftyJSON

public class OTTPlaybackContext: OTTBaseObject {

    public var sources: [OTTPlaybackSource] = []

    public required init?(json: Any) {
        let jsonObject = JSON(json)
        jsonObject["sources"].array?.forEach { (source: JSON) in
            if let source = OTTPlaybackSource(json: source.object) {
                sources.append(source)
            }
        }
    }
}
