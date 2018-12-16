//
//  AlertAction+General.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation

extension Alert.Action {
    static let ok: Alert.Action = .init(title: "OK")
    static let cancel: Alert.Action = .init(title: "Cancel", style: .cancel)
}
