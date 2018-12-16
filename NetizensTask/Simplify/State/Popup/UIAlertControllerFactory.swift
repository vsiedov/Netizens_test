//
//  UIAlertControllerFactory.swift
//  App
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit

final class UIAlertControllerFactory {
    static func makeAlertController(alert: Alert) -> UIAlertController {
        let alertController: UIAlertController = .init(
            title: alert.title,
            message: alert.message,
            preferredStyle: .alert
        )
        let actions = alert.actions.isEmpty ? [.ok] : alert.actions
        actions.forEach {
            alertController.addAction(UIAlertActionFactory.makeAlertAction(action: $0))
        }
        return alertController
    }
}
