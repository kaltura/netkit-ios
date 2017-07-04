//
//  OTTPushNotificationServices.swift
//  Pods
//
//  Created by Vadim Ratchkov on 11/05/2017.
//
//

import UIKit
import SwiftyJSON

@objc public enum SortType: Int {
    
    case oldestFirst
    case newestFirs
    case unknown
    
    var asString: String {
        switch self {
        case .oldestFirst: return "oldest_first"
        case .newestFirs: return "newest_first"
        case .unknown: return ""
        }
    }
}


public class OTTPushNotificationServices: NSObject {
    public static func getNotificationSettingsState(baseURL: String, token: String) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "notificationsSettings", action: "get") {
            if (!token.isEmpty) {
                request.setBody(key: "ks", value: JSON(token))
            }
            return request
        }
        return nil
    }
    
    public static func setNotificationSettingsState(baseURL: String, token: String, notificationEnabled: Bool, followEnabled: Bool) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "notificationsSettings", action: "update") {
            let notificationEnabledStr:String = notificationEnabled ? "true" : "false"
            let followEnabledStr: String = followEnabled ? "true" : "false"
            let settings: [String: String] = ["objectType": "KalturaNotificationsSettings",
                                              "pushNotificationEnabled": notificationEnabledStr,
                                              "pushFollowEnabled": followEnabledStr]
            request.setBody(key: "settings", value: JSON(settings))
            if (!token.isEmpty) {
                request.setBody(key: "ks", value: JSON(token))
            }

            return request
        }
        return nil
    }
    
    public static func setDevisePushToken(baseURL: String, pushToken: String, deviceToken: String) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "Notification", action: "setDevicePushToken") {
            request.setOTTBasicParams()
            if (!pushToken.isEmpty) {
                request.setBody(key: "pushToken", value: JSON(pushToken))
            }
            if (!deviceToken.isEmpty) {
                request.setBody(key: "ks", value: JSON(deviceToken))
            }
            
            return request
        }
        return nil
    }
    
    
    public static func addFollowTVSeries(baseURL: String, assetID: String, token: String) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "followTvSeries", action: "add") {
            request.setOTTBasicParams()
            if (!token.isEmpty) {
                request.setBody(key: "ks", value: JSON(token))
            }
            if (!assetID.isEmpty) {
                let assetId = Int(assetID)
                let followSettingd: [String: String] = ["objectType": "KalturaFollowTvSeries", "assetId": assetID]
                request.setBody(key: "followTvSeries", value: JSON(followSettingd))
            }
            return request
        }
        return nil
    }
    
    public static func deleteFollowTVSeries(baseURL: String, assetID: String, token: String) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "followTvSeries", action: "delete") {
            if (!token.isEmpty) {
                request.setBody(key: "ks", value: JSON(token))
            }
            if (!assetID.isEmpty) {
                request.setBody(key: "asset_id", value: JSON(assetID))
            }
            return request
        }
        return nil
    }
    
    public static func listFollowTVSeries(baseURL: String, token: String, sortType: SortType) -> KalturaRequestBuilder? {
        if let request = KalturaRequestBuilder(url: baseURL, service: "followTvSeries", action: "list") {
            if (!token.isEmpty) {
                request.setBody(key: "ks", value: JSON(token))
            }
            request.setBody(key: "order_by", value: JSON(sortType.asString))
            return request
        }
        return nil
    }
    
}

