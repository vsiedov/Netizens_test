//
//  ListDataSourceType.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import Closures

protocol ListDataSourceType: TableViewDataSourceType {
    func update(_ items: PicItems)
    func item(at indexPath: IndexPath) -> PicItem
    func isEmpty() -> Bool
}
