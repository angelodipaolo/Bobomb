//
//  ResourceType.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public protocol BobombResource {
     var resourceType: ResourceType {get}
}

public enum ResourceType: String {
    case Game = "game"
    case Platform = "platform"
}
