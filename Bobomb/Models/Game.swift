//
//  Game.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/30/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Game: Codable {
    public let id: Int
    public let name: String
    public let description: String
    public let deck: String
    public var image: Image?
    public let platforms: [Platform]
    public let siteDetailURLString: String
    public let apiDetailURLString: String
    public var aliases: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case deck = "deck"
        case platforms = "platforms"
        case siteDetailURLString = "site_detail_url"
        case apiDetailURLString = "api_detail_url"
        case aliases = "aliases"
    }
}
