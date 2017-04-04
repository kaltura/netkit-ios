//
//  OVPList.swift
//  Pods
//
//  Created by Rivka Peleg on 28/11/2016.
//
//

import UIKit

public class OVPList: OVPBaseObject {

    
    public var objects: [OVPBaseObject]?
    
    public init(objects:[OVPBaseObject]?) {
        self.objects = objects
    }
    
    public required init?(json: Any) {
        
    }
}
