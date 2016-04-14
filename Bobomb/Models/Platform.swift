//
//  Platform.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import MeeSeeks

public struct Platform {
    public let id: String
    public let name: String
    public let abbreviation: String
    public let siteDetailURLString: String
    public let apiDetailURLString: String
}

// MARK: - JSON Serialization

extension Platform: JSONDecodable {
    public static func decode(json: AnyObject) -> Platform? {
        return Platform(json: json)
    }
    
    public init?(json: AnyObject) {
        guard
            let name                = json["name"] as? String,
            let siteDetailURLString = json["site_detail_url"] as? String,
            let apiDetailURLString  = json["api_detail_url"] as? String,
            let abbreviation        = json["abbreviation"] as? String,
            let id                  = json["id"] as? String
         else { return nil }
        
        self.name = name
        self.abbreviation = abbreviation
        self.id = id
        self.siteDetailURLString = siteDetailURLString
        self.apiDetailURLString = apiDetailURLString
    }
}
