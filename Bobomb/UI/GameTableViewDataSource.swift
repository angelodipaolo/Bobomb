//
//  GameTableViewDataSource.swift
//  GamePassword
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation
import UIKit
import MeeSeeks

public final class GameTableViewDataSource<CellType: UITableViewCell where CellType: GameTableViewCellType>: NSObject, UITableViewDataSource {
    let gameDataSource: GameModelDataSourceType
    
    public init(gameDataSource: GameModelDataSourceType) {
        self.gameDataSource = gameDataSource
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameDataSource.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as CellType
        
        let game = gameDataSource.game(atIndex: indexPath.row)
        cell.update(game: game)
        
        return cell
    }
}
