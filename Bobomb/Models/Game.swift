//
//  Game.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/30/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import MeeSeeks

public struct Game {
    public let id: Int
    public let name: String
    public let description: String
    public let deck: String
    public var image: Image?
    public let platforms: [Platform]
    public let siteDetailURLString: String
    public let apiDetailURLString: String
    public var aliases: String?
}

// MARK: - JSON Serialization

extension Game: JSONDecodable {
    public init?(json: [String: Any]) throws {
        guard
            let name                = json["name"] as? String,
            let description         = json["description"] as? String,
            let id                  = json["id"] as? Int,
            let siteDetailURLString = json["site_detail_url"] as? String,
            let deck                = json["deck"] as? String,
            let apiDetailURLString  = json["api_detail_url"] as? String,
            let platformJSON        = json["platforms"] as? [[String: Any]],
            let platforms           = try MeeSeeks.JSONDecoder<Platform>.decode(jsonArray: platformJSON)
        else { return nil }
    
        self.aliases = json["aliases"] as? String
        self.name = name
        self.description = description
        self.id = id
        self.siteDetailURLString = siteDetailURLString
        self.deck = deck
        self.apiDetailURLString = apiDetailURLString
        self.platforms = platforms
        
        if let imageJSON = json["image"] as? [String: Any] {
            self.image = try MeeSeeks.JSONDecoder<Image>.decode(json: imageJSON)
        }
    }
}
