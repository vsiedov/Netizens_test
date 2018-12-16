//
//  PicItemMapper.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import PromiseKit
import TaskAPI

final class PicItemMapper {
    static func makeItems(_ response: [GetPlaceholderPicResponse]) -> Guarantee<PicItems> {
        return Guarantee.value(response.compactMap { PicItemMapper.map($0) })
    }
    
    static private func map(_ response: GetPlaceholderPicResponse) -> PicItem? {
        guard let id = response.id, let title = response.title, let thumbnailURL = response.thumbnailUrl, let imageURL = response.url else { return nil }
        return .init(id: id,
                    thumbnailUrl: URL.init(fileURLWithPath: thumbnailURL),
                    url: URL.init(fileURLWithPath: imageURL),
                    title: title)
    }
}
