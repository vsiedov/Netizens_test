//
//  APINoContentDecoder.swift
//  API
//
//  Created by Vladyslav Siedov on 24/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore

public struct APINoContentDecoder: APIResponseDecoding {
    public typealias Response = NoContent
    
    public static func decode(data: Data?, status: HTTPStatus?, error: Error?) throws -> Response {
        guard let status = status else {
            throw APIFailure.makeInternalFailure(error: error)
        }
        
        switch status {
            case .accepted, .noContent:
                return .init()
            default:
                if let data = data {
                    throw APIFailure.makeServerFailure(status: status, and: data)
                } else {
                    throw APIFailure.makeInternalFailure(error: error)
                }
        }
    }
}

extension APINoContentDecoder {
    public struct NoContent: Decodable {}
}
