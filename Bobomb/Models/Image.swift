//
//  Image.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import MeeSeeks

public struct Image {
    public var iconURL: URL?
    public var mediumURL: URL?
}

extension Image: JSONDecodable {
    public init?(json: [String : Any]) throws {
        if let iconURLString = json["icon_url"] as? String {
            self.iconURL = URL(string: iconURLString)
        }
        
        if let mediumURLString = json["medium_url"] as? String {
            self.mediumURL = URL(string: mediumURLString)
        }
    }
}
