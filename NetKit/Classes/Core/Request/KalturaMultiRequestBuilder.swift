//
//  RestMultiRequestBuilder.swift
//  Pods
//
//  Created by Admin on 13/11/2016.
//
//

import UIKit
import SwiftyJSON

public class KalturaMultiRequestBuilder: KalturaRequestBuilder {
    
    var requests: [KalturaRequestBuilder] = [KalturaRequestBuilder]()

    public init?(url: String) {
        super.init(url: url, service: "multirequest", action: nil)
    }
    
    @discardableResult
    public func add(request:KalturaRequestBuilder) -> Self {
        self.requests.append(request)
        return self
    }
    
    override public func build() -> Request {
        
        let data = self.kalturaMultiRequestData()
        let request = RequestElement(requestId: self.requestId, method: self.method, url: self.url, dataBody: data, headers: self.headers, timeout: self.timeout, configuration: self.configuration, responseSerializer: self.responseSerializer, completion: self.onComplete)
        
        return request
    }
    
    func kalturaMultiRequestData() -> Data? {
        
        if self.jsonBody == nil {
            self.jsonBody = JSON([String: Any]())
        }
        
        for (index, request) in self.requests.enumerated() {
            if let body = request.jsonBody {
                var singleRequestBody: JSON = body
                singleRequestBody["action"] = JSON(request.action ?? "")
                singleRequestBody["service"] =  JSON(request.service ?? "")
                self.jsonBody?[String(index+1)] = singleRequestBody
            }
        }
        
        let prefix = "{"
        let suffix = "}"
        var data = prefix.data(using: String.Encoding.utf8)
        
        for index in 1...self.requests.count {
            let requestBody = self.jsonBody?[String(index)].rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions())?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let requestBodyData = requestBody?.data(using: String.Encoding.utf8)
            data?.append("\"\(index)\":".data(using: String.Encoding.utf8)!)
            data?.append(requestBodyData!)
            data?.append(",".data(using: String.Encoding.utf8)!)
            _ = self.jsonBody?.dictionaryObject?.removeValue(forKey: String(index))
        }
        
        if let jsonBody = self.jsonBody {
            let remainingJsonAsString: String? = jsonBody.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions())
            if let jsonString = remainingJsonAsString{
                var jsonWithoutLastChar = String(jsonString[..<jsonString.index(before: jsonString.endIndex)])
                
                jsonWithoutLastChar = String(jsonWithoutLastChar[jsonString.index(after: jsonString.startIndex)...])
                data?.append((jsonWithoutLastChar.data(using: String.Encoding.utf8))!)
            }
        }
        
        data?.append(suffix.data(using: String.Encoding.utf8)!)
        
        return data
    }
    
    override func onComplete(_ response: Response) {
        // calling on complete of each request
        var allResponse: [Any] = []
        if let dict = response.data as? [String: Any], let responses = dict["result"] as? [Any] {
            allResponse = responses
        }
        else if let responses = response.data as? [Any] {
            allResponse = responses
        }
        for (index, request) in self.requests.enumerated() {
            let singleResponse = allResponse[index]
            let response = Response.init(data: singleResponse, error: response.error)
            request.completion?(response)
        }
        
        completion?(response)
        
        return
    }
}


