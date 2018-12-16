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
    static func makeVolaAPI(configuration: APIClientWithOAuth2Configuration) -> VolaAPI {
        let api: API = AlamofireAPIClientFactory.makeAPI(configuration: configuration)
        api.authorization.onSessionDidChange = { session in
            Keychain.default[.volaSession] = session
        }
        return .init(authorization: api.authorization, client: api.client)
    }
}
