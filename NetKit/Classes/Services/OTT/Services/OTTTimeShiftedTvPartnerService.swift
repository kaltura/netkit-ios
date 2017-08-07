//
//  OTTTimeShiftedTvPartnerSettings.swift
//  Pods
//
//  Created by Oded Klein on 02/08/2017.
//
//

import UIKit
import SwiftyJSON

public class OTTTimeShiftedTvPartnerService {

    public static func getTimeShiftedTvPartnerSettings(baseURL: String, ks: String, partner: Int, udid: String) -> KalturaRequestBuilder? {
        
        if let request: KalturaRequestBuilder = KalturaRequestBuilder(url: baseURL, service: "timeshiftedtvpartnersettings", action: "get") {
            request
                .setBody(key: "partnerId", value: JSON(partner))
                .setBody(key: "udid", value:JSON(udid))
                .setBody(key: "ks", value: JSON(ks))
            return request
        } else {
            return nil
        }
    }
}
