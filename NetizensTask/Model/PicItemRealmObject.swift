//
//  PicItemRealmObject.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import RealmSwift

final class PicItemRealmObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var thumbnailUrl: String?
    @objc dynamic var url: String?
    
    static func makeRealmObject(item: PicItem) -> PicItemRealmObject {
        let newObject = PicItemRealmObject()
        
        newObject.id = item.id
        newObject.title = item.title
        newObject.thumbnailUrl = item.thumbnailUrl.absoluteString
        newObject.url = item.url.absoluteString
        
        return newObject
    }
}
