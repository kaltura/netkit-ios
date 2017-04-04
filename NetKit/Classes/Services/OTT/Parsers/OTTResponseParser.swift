//
//  OTTRequestParser.swift
//  Pods
//
//  Created by Admin on 23/11/2016.
//
//

import UIKit
import SwiftyJSON

public class OTTResponseParser: NSObject {

    public enum OTTResponseParserError: Error {
        case typeNotFound
        case invalidJsonObject
    }

    public static func parse(data:Any) throws -> OTTBaseObject {

        let jsonResponse = JSON(data)
        let resultObjectJSON = jsonResponse["result"].dictionaryObject
        let objectType: OTTBaseObject.Type? = OTTObjectMapper.classByJsonObject(json: resultObjectJSON)
        if let type = objectType, let resultJSON = resultObjectJSON {
            if let object = type.init(json: resultJSON) {
                return object
            } else {
              throw OTTResponseParserError.invalidJsonObject
            }
        } else {
            throw OTTResponseParserError.typeNotFound
        }
    }
}
