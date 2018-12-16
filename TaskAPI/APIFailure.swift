//
//  APIFailure.swift
//  API
//
//  Created by Vladyslav Siedov on 24/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore

public enum APIFailure: Error {
    case `internal`(Internal)
    case server(Server)
    
    public enum Internal {
        case unknown(Error?)
        case encoding(Error)
        case decoding(Error)
        case connection(Connection)
        
        public enum Connection {
            case timeout
            case lost
        }
    }
    
    public struct Server {
        public let status: HTTPStatus
        public let content: Content
        
        public enum Content {
            case error(Error)
            case invalid(Invalid)
            case unauthorized(Unauthorized)
            case unsupported(Unsupported)
            case undecodable
            
            public struct Error: Decodable {
                public let code: String
                public let message: String
            }
            
            public struct Invalid: Decodable {
                public let message: [String: String]
            }
            
            public struct Unauthorized: Decodable {
                public let error: String
                public let description: String
            }
            
            public enum Unsupported {
                case string(String)
            }
        }
    }
}

// MARK: - Factory
extension APIFailure {
    public static func makeInternalFailure(error: Error?) -> APIFailure {
        if let error = error as NSError?, error.domain == NSURLErrorDomain  {
            switch error.code {
                case NSURLErrorTimedOut:
                    return .internal(.connection(.timeout))
                case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost, NSURLErrorCannotFindHost:
                    return .internal(.connection(.lost))
                default:
                    break
            }
        }
        
        return .internal(.unknown(nil))
    }
    
    public static func makeInternalDecodingFailure(error: Error) -> APIFailure {
        return .internal(.decoding(error))
    }
    
    public static func makeServerFailure(status: HTTPStatus, and data: Data) -> APIFailure {
        let content: Server.Content
        do {
            content = try JSONDecoder().decode(Server.Content.self, from: data)
        } catch {
            content = .undecodable
        }
        return .server(.init(status: status, content: content))
    }
}

// MARK: - Decodable
extension APIFailure.Server.Content: Decodable {
    public init(from decoder: Decoder) throws {
        if let error = try? Error(from: decoder) {
            self = .error(error)
        } else if let invalid = try? Invalid(from: decoder) {
            self = .invalid(invalid)
        } else if let unauthorized = try? Unauthorized(from: decoder) {
            self = .unauthorized(unauthorized)
        } else {
            self = .unsupported(try Unsupported(from: decoder))
        }
    }
}

extension APIFailure.Server.Content.Unsupported: Decodable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self = .string(try container.decode(String.self))
    }
}
