//
//  URL+Utils.swift
//  Pods
//
//  Created by Sergey Chausov on 19.01.2021.
//

import Foundation

public extension URL {
    
    func appendingQueryComponent(key: String, value: String) -> URL {
        guard var components = URLComponents(string: absoluteString) else { return self }
        
        var items: [URLQueryItem] = components.queryItems ??  []
        items.append(URLQueryItem(name: key, value: value))
        components.queryItems = items
        
        return components.url ?? self
    }
}
