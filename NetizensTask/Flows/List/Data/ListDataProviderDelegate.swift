//
//  ListDataProviderDelegate.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import PromiseKit

protocol ListDataProviderDelegate {
    func getItemsList() -> Promise<PicItems>
    func saveItems(items: PicItems)
}
