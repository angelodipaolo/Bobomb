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
    public var iconURL: NSURL?
    public var mediumURL: NSURL?
}

extension Image: JSONDecodable {
    public static func decode(json: AnyObject) -> Image? {
        return Image(json: json)
    }
    
    public init?(json: AnyObject) {
        if let iconURLString = json["icon_url"] as? String {
            self.iconURL = NSURL(string: iconURLString)
        }
        
        if let mediumURLString = json["medium_url"] as? String {
            self.mediumURL = NSURL(string: mediumURLString)
        }
    }
}
