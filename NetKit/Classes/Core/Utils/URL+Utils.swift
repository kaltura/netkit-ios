//
//  URL+Utils.swift
//  Pods
//
//  Created by Sergey Chausov on 19.01.2021.
//

import Foundation

public extension URL {
    
    func appendingQueryComponent(key: String, value: String) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
        
        var items: [URLQueryItem] = components.queryItems ??  []
        items.append(URLQueryItem(name: key, value: value))
        components.queryItems = items
        
        return components.url ?? self
    }
    
    @available(iOS 11.0, tvOS 11.0, *)
    func appendingPercentEncodedQueryComponent(key: String, value: String) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
        
        var items: [URLQueryItem] = components.percentEncodedQueryItems ??  []
        items.append(URLQueryItem(name: key, value: escape(value)))
        components.percentEncodedQueryItems = items
        
        return components.url ?? self
    }
    
    func escape(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowedCharacterSet) ?? string
    }
    
}

extension CharacterSet {
    /// RFC 3986 allowed characters.
    public static let urlQueryAllowedCharacterSet: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        let encodableDelimiters = CharacterSet(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")

        return CharacterSet.urlQueryAllowed.subtracting(encodableDelimiters)
    }()
}
