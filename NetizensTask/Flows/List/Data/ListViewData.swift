//
//  ListViewData.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation

typealias PicItems = [PicItem]

struct ListViewData {
    
    var title: String {
        return item.title
    }
    
    var imageURL: URL {
        return item.thumbnailUrl.appendingPathExtension("png")
    }
    
    private let item: PicItem
    
    init(item: PicItem) {
        self.item = item
    }
}

