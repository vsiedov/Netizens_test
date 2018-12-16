//
//  UIAlertActionStyleFactory.swift
//  App
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit

final class UIAlertActionStyleFactory {
    static func makeAlertActionStyle(style: Alert.Action.Style) -> UIAlertAction.Style {
        switch style {
            case .default:      return .default
            case .cancel:       return .cancel
            case .destructive:  return .destructive
        }
    }
}
