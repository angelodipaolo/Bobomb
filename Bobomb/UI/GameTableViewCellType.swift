//
//  GameTableViewCellType.swift
//  GamePassword
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit
import MeeSeeks

public protocol GameTableViewCellType: TableViewCellType {
    func update(game game: Game)
}
