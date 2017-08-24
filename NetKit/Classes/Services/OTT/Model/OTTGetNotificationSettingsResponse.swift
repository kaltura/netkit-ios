//
//  OTTGetNotificationSettingsResponse.swift
//  Pods
//
//  Created by Vadim Ratchkov on 15/05/2017.
//
//

import UIKit
import SwiftyJSON

public class OTTGetNotificationSettingsResponse: OTTBaseObject {
    
    public var pushFollowEnabled: Bool
    public var pushNotificationEnabled: Bool
    
    public required init?(json:Any) {
        let notificationJsonResponse = JSON(json)
        
        guard let followEnabled = notificationJsonResponse["push_follow_enabled"].bool,
            let notificationEnabled = notificationJsonResponse["push_notification_enabled"].bool
            else {
                return nil
        }
        self.pushFollowEnabled = followEnabled
        self.pushNotificationEnabled = notificationEnabled
    }
}

