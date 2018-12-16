//
//  TestApiFactory.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import NetworkCore
import AlamofireAPIClient

final class TestAPIFactory {
    static func makeAPI(configuration: APIClientConfiguration) -> TestAPI {
        let api: API = AlamofireAPIClientFactory.makeAPI(configuration: configuration)
        return .init(client: api.client)
    }
}
