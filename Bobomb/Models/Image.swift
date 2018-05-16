//
//  Image.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Image: Codable {
    public var iconURL: URL?
    public var mediumURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case mediumURL = "medium_url"
    }
}
