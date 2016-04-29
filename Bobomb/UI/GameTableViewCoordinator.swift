//
//  GameTableViewCoordinator.swift
//  GamePassword
//
//  Created by Angelo Di Paolo on 4/28/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

public final class GameTableViewCoordinator<CellType: UITableViewCell where CellType: GameTableViewCellType> {
    public let tableViewDataSource: GameTableViewDataSource<CellType>
    public let tableViewDelegate: GameTableViewDelegate
    
    public init(gameDataSource: GameModelDataSourceType) {
        self.tableViewDataSource = GameTableViewDataSource<CellType>(gameDataSource: gameDataSource)
        self.tableViewDelegate = GameTableViewDelegate(gameDataSource: gameDataSource)
    }
    
    deinit {
        print("deinit GameTableViewCoordinator")
    }
}

extension GameTableViewCoordinator: TableViewCoordinatorType {
    public func registerTableView(tableView: UITableView) {
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableView.registerCellOfType(CellType)
    }
}

public protocol TableViewCoordinatorType: class {
    func registerTableView(tableView: UITableView)
}
