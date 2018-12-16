//
//  API.swift
//  NetworkCore
//
//  Created by Vladyslav Siedov on 12/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

open class API {
    public let client: APIClientType
    
    public init(client: APIClientType) {
        self.client = client
    }
}
