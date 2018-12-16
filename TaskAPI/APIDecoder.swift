//
//  APIDecoder.swift
//  API
//
//  Created by Vladyslav Siedov on 24/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore

public struct APIDecoder<T: Decodable>: APIResponseDecoding {
    public typealias Response = T
    
    public static func decode(data: Data?, status: HTTPStatus?, error: Error?) throws -> Response {
        guard let data = data, let status = status else {
            throw APIFailure.makeInternalFailure(error: error)
        }
        
        switch status {
            case .ok, .created:
                return try decode(data)
            default:
                throw APIFailure.makeServerFailure(status: status, and: data)
        }
    }
    
    private static func decode(_ data: Data) throws -> Response {
        do {
            let decoder: JSONDecoder = .init()
            decoder.dateDecodingStrategy = .custom { decoder throws -> Date in
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                
                let formatter = ISO8601DateFormatter()
                formatter.formatOptions = [.withInternetDateTime]
                if #available(iOS 11.2, *) {
                    formatter.formatOptions = formatter.formatOptions.union([.withFractionalSeconds])
                }
                
                if let date = formatter.date(from: string) ?? ISO8601DateFormatter().date(from: string) {
                    return date
                }
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
            }
            return try decoder.decode(Response.self, from: data)
        } catch {
            throw APIFailure.makeInternalDecodingFailure(error: error)
        }
    }
}
