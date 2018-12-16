//
//  UIAlertActionFactory.swift
//  App
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit

final class UIAlertActionFactory {
    static func makeAlertAction(action: Alert.Action) -> UIAlertAction {
        return .init(
            title: action.title,
            style: UIAlertActionStyleFactory.makeAlertActionStyle(style: action.style),
            handler: { _ in action.handler?() }
        )
    }
}
