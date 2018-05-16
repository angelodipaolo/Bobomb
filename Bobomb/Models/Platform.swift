//
//  Platform.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Platform: Codable {
    public var id: Int
    public var name: String
    public var abbreviation: String
    public var siteDetailURLString: String
    public var apiDetailURLString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case abbreviation = "abbreviation"
        case siteDetailURLString = "site_detail_url"
        case apiDetailURLString = "api_detail_url"
    }
}
