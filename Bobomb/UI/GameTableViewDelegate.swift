//
//  GameTableViewDelegate.swift
//  GamePassword
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit
import MeeSeeks

@objc public final class GameTableViewDelegate: NSObject, UITableViewDelegate {
    private let gameDataSource: GameModelDataSourceType
    public weak var gameInteractionDelegate: GameInteractionDelegate?
    
    public init(gameDataSource: GameModelDataSourceType) {
        self.gameDataSource = gameDataSource
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let game = gameDataSource.game(atIndex: indexPath.row)
        gameInteractionDelegate?.gameSelected(game)
    }
}
