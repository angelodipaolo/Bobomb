//
//  GameModelDataSourceType.swift
//  GamePassword
//
//  Created by Angelo Di Paolo on 4/25/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

public protocol GameModelDataSourceType: class {
    var count: Int {get}
    func game(atIndex index: Int) -> Game
}
