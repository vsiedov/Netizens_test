//
//  ListViewModelType.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import UIKit
import Closures

protocol ListViewModelType: class {
    var tableViewDataSource: TableViewDataSourceType { get }
    func start()
    func item(at indexPath: IndexPath) -> ListViewData
    func didSelectRow(at indexPath: IndexPath)
}
