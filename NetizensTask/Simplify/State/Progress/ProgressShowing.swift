//
//  ProgressShowing.swift
//  App
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

protocol ProgressShowing: class {
    func showIndicator(animated: Bool)
    func hideIndicator(animated: Bool)
}
