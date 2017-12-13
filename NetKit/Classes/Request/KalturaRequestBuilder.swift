//
//  RestRequestBuilder.swift
//  Pods
//
//  Created by Admin on 13/11/2016.
//
//

import UIKit
import SwiftyJSON


public class KalturaRequestBuilder: RequestBuilder {

    public var service: String?
    public var action: String?

    public init?(url: String?, service: String?, action: String?) {
        
        guard let baseURL = url else {
            return nil
        }
        
        var path = baseURL
        if let service = service {
            self.service = service
            let serviceSuffix = "/service/" + service
            path += serviceSuffix
        }
        
        if let action = action {
            self.action = action
            let actionSuffix = "/action/" + action
            path += actionSuffix
        }

        super.init(url: path)
        
        self.add(headerKey: "Content-Type", headerValue: "application/json").add(headerKey: "Accept", headerValue: "application/json")
        self.set(method: .post)
        
    }
       
    
    @discardableResult
    public func setClientTag(clientTag: String) -> Self {
        self.setBody(key: "clientTag", value: JSON(clientTag))
        return self
    }
    
    @discardableResult
    public func setApiVersion(apiVersion: String) -> Self {
        self.setBody(key: "apiVersion", value: JSON(apiVersion))
        return self
    }
    
    @discardableResult
    public func setFormat(format: Int) -> Self {
        self.setBody(key: "format", value: JSON(format))
        return self
    }
    
}
