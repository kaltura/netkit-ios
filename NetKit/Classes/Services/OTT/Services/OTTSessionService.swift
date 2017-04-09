//
//  OTTSessionService.swift
//  Pods
//
//  Created by Admin on 17/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OTTSessionService: NSObject {

    public static func get(baseURL: String, ks: String) -> KalturaRequestBuilder? {

        if let request = KalturaRequestBuilder(url: baseURL, service: "session", action: "get") {
            request
                .setBody(key: "ks", value: JSON(ks))
            return request
        } else {
            return nil
        }

    }

    public static func switchUser(baseURL: String, ks: String, userId: String) -> KalturaRequestBuilder? {

        if let request = KalturaRequestBuilder(url: baseURL, service: "session", action: "switchUser") {
            request
                .setBody(key: "ks", value: JSON(ks))
                .setBody(key: "userIdToSwitch", value: JSON(userId))
            return request
        } else {
            return nil
        }

    }

}
