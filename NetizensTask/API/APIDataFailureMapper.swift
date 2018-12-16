//
//  APIDataFailureMapper.swift
//  App
//
//  Created by Vladyslav Siedov on 16/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import TaskAPI

final class APIDataFailureMapper {
    static func map(error: Error) -> APIDataFailure {
        guard let failure = error as? APIFailure else {
            return .connection
        }
        
        switch failure {
            case .internal(let `internal`):
                switch `internal` {
                    case .connection:
                        return .connection
                    case .encoding, .decoding, .unknown:
                        return .internal
                }
            case .server(let server):
                switch server.content {
                    case .error, .invalid, .undecodable, .unsupported, .unauthorized:
                        return .server
            }
        }
    }
}
