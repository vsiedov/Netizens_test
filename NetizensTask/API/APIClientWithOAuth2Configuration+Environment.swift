//
//  APIClient.swift
//  App
//
//  Created by Vladyslav Siedov on 12/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore

extension APIClientConfiguration {
    
    static var staging: APIClientConfiguration {
        return .init(
            scheme: .https,
            host: "jsonplaceholder.typicode.com/"
        )
    }
}
