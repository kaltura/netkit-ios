//
//  OTTRequestParser.swift
//  Pods
//
//  Created by Admin on 23/11/2016.
//
//

import UIKit
import SwiftyJSON

class OVPResponseParser: NSObject {
    
    enum error: Error {
        case typeNotFound
        case invalidJsonObject
    }
    
    static func parse(data:Any) throws -> OVPBaseObject {
        
        let jsonResponse = JSON(data)
        let resultObjectJSON = jsonResponse.dictionaryObject
        
        guard let dict = resultObjectJSON else {
            throw error.invalidJsonObject
        }
        
        
        let objectType: OVPBaseObject.Type? = OVPObjectMapper.classByJsonObject(json: dict)
        if let type = objectType{
            if let object = type.init(json: dict) {
                return object
            } else {
                throw error.invalidJsonObject
            }
        } else {
            throw error.typeNotFound
        }
    }
    
    
    static func parse<T>(data:Any) throws -> T? {
        
        let jsonResponse = JSON(data)
        let resultObjectJSON = jsonResponse.dictionaryObject
        
        guard let dict = resultObjectJSON else {
            throw error.invalidJsonObject
        }
        
        if let type = T.self as? OVPBaseObject.Type {
            if let object = type.init(json: dict) {
                if let result = object as? T {
                    return result
                } else {
                    return nil
                }
            } else {
                throw error.invalidJsonObject
            }
        } else {
            throw error.typeNotFound
        }
    }
}



