//
//  GameResult.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/30/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct GameResult: BobombResource {
    public let resourceType = ResourceType.Game
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

extension GameResult: JSONSerializable {
    
    public init?(dictionary: NSDictionary) {
        
        self.aliases = dictionary["aliases"] as? String
        
        if let name                 = dictionary["name"] as? String,
            let description         = dictionary["description"] as? String,
            let id                  = dictionary["id"] as? Int,
            let siteDetailURLString = dictionary["site_detail_url"] as? String,
            let deck                = dictionary["deck"] as? String,
            let apiDetailURLString  = dictionary["api_detail_url"] as? String,
            let platformJSON        = dictionary["platforms"] as? [NSDictionary],
            let platforms           = ModelSerializer<Platform>.modelsFromArray(platformJSON) {
                
                self.name = name
                self.description = description
                self.id = id
                self.siteDetailURLString = siteDetailURLString
                self.deck = deck
                self.apiDetailURLString = apiDetailURLString
                self.platforms = platforms
        } else {
            return nil
        }
    }
}
