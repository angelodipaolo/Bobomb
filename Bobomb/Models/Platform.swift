//
//  Platform.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Platform: BobombResource {
    public var resourceType = ResourceType.Platform
    public let id: String
    public let name: String
    public let abbreviation: String
    public let siteDetailURLString: String
    public let apiDetailURLString: String
}

// MARK: - JSON Serialization

extension Platform: JSONSerializable {
    
    public init?(dictionary: NSDictionary) {
        if let name                 = dictionary["name"] as? String,
            let siteDetailURLString = dictionary["site_detail_url"] as? String,
            let apiDetailURLString  = dictionary["api_detail_url"] as? String,
            let abbreviation        = dictionary["abbreviation"] as? String,
            let id                  = dictionary["id"] as? String {
                
                self.name = name
                self.abbreviation = abbreviation
                self.id = id
                self.siteDetailURLString = siteDetailURLString
                self.apiDetailURLString = apiDetailURLString
        }
        
        return nil
    }
}
