//
//  PicItemRealmObjectMapper.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation

import Foundation
import RealmSwift

final class PicItemRealmObjectMapper {
    static func makeItems(_ items: PicItems) -> [PicItemRealmObject] {
        return items.compactMap { PicItemRealmObject.makeRealmObject(item: $0) }
    }
}
