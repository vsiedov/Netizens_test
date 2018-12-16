//
//  ListViewModelViewDelegate.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation

protocol ListViewModelViewDelegate: PopupShowing, ProgressShowing {
    func reloadTableView()
    func updateTableViewBackgroundText(_ text: String?)
}
