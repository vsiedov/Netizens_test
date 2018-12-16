//
//  ListDataSource.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import Closures
import UIKit
import PromiseKit

final class ListDataSource: TableViewDataSource {
    private var items = PicItems()
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

// MARK: - UITableViewDataSource
extension ListDataSource {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - RestaurantsDataSourceType
extension ListDataSource: ListDataSourceType {
    func update(_ items: PicItems) {
        self.items = items
    }
    
    func item(at indexPath: IndexPath) -> PicItem {
        return items[indexPath.row]
    }
}
