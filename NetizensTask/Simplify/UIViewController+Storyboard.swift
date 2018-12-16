//
//  UIViewController+Storyboard.swift
//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 13/03/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit

public extension UIViewController {
    static func instantiateFromStoryboard() -> Self {
        return self.instantiateFromStoryboard(self)
    }
    
    private static func instantiateFromStoryboard<T>(_ type: T.Type) -> T {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        return viewController as! T
    }
}
