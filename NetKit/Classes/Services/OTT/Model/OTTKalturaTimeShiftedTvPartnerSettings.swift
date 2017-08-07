//
//  OTTKalturaTimeShiftedTvPartnerSettings.swift
//  Pods
//
//  Created by Oded Klein on 02/08/2017.
//
//

import UIKit
import SwiftyJSON

public class OTTKalturaTimeShiftedTvPartnerSettings: OTTBaseObject {

    public var catchUpEnabled = false
    public var cdvrEnabled = false
    public var startOverEnabled = false
    public var trickPlayEnabled = false
    var recordingScheduleWindowEnabled = false
    var protectionEnabled = false
    
    var catchUpBufferLength = 0
    var trickPlayBufferLength = 0
    var recordingScheduleWindow = 0
    var paddingBeforeProgramStarts = 0
    var paddingAfterProgramEnds = 0

    var protectionPeriod = 0
    var protectionQuotaPercentage = 0
    var recordingLifetimePeriod = 0
    var cleanupNoticePeriod = 0

    var seriesRecordingEnabled = false
    var nonEntitledChannelPlaybackEnabled = false
    var nonExistingChannelPlaybackEnabled = false

    var recoveryGracePeriod = 0
    
    public required init(json:Any) {
        let jsonDict = JSON(json)

        catchUpEnabled = jsonDict["catchUpEnabled"].bool ?? false
        cdvrEnabled = jsonDict["cdvrEnabled"].bool ?? false
        startOverEnabled = jsonDict["startOverEnabled"].bool ?? false
        trickPlayEnabled = jsonDict["trickPlayEnabled"].bool ?? false
        recordingScheduleWindowEnabled = jsonDict["recordingScheduleWindowEnabled"].bool ?? false
        protectionEnabled = jsonDict["protectionEnabled"].bool ?? false

        
        catchUpBufferLength = jsonDict["catchUpBufferLength"].int ?? 0
        trickPlayBufferLength = jsonDict["trickPlayBufferLength"].int ?? 0
        recordingScheduleWindow = jsonDict["recordingScheduleWindow"].int ?? 0
        paddingBeforeProgramStarts = jsonDict["paddingBeforeProgramStarts"].int ?? 0
        paddingAfterProgramEnds = jsonDict["paddingAfterProgramEnds"].int ?? 0

        protectionPeriod = jsonDict["protectionPeriod"].int ?? 0
        protectionQuotaPercentage = jsonDict["protectionQuotaPercentage"].int ?? 0
        recordingLifetimePeriod = jsonDict["recordingLifetimePeriod"].int ?? 0
        cleanupNoticePeriod = jsonDict["cleanupNoticePeriod"].int ?? 0

        seriesRecordingEnabled = jsonDict["seriesRecordingEnabled"].bool ?? false
        nonEntitledChannelPlaybackEnabled = jsonDict["nonEntitledChannelPlaybackEnabled"].bool ?? false
        nonExistingChannelPlaybackEnabled = jsonDict["nonExistingChannelPlaybackEnabled"].bool ?? false

        recoveryGracePeriod = jsonDict["recoveryGracePeriod"].int ?? 0

    }

}
