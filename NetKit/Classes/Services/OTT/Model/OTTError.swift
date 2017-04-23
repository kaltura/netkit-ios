//
//  OTTError.swift
//  Pods
//
//  Created by Rivka Peleg on 24/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OTTError: OTTBaseObject {

    public var message: String?
    public var code: String?

    let errorKey = "error"
    let messageKey = "message"
    let codeKey = "code"

    public required init?(json: Any) {

        let jsonObj: JSON = JSON(json)
        let errorDict = jsonObj[errorKey]
        self.message = errorDict[messageKey].string
        self.code = errorDict[codeKey].string
    }

}

public enum OTTErrorCode: Int {
    
    case UserNotActivated = 2016
    
}
