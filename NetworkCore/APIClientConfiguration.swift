//
//  APIClientConfiguration.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedov on 24/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

public class APIClientConfiguration {
    public let scheme: Scheme
    public let host: String
    public let port: Port
    
    public init(scheme: Scheme, host: String, port: Port = .default) {
        self.scheme = scheme
        self.host = host
        self.port = port
    }
}

public extension APIClientConfiguration {
    enum Scheme: String {
        case http
        case https
    }
    
    enum Port {
        case `default`
        case custom(Int)
        
        public var value: Int? {
            switch self {
                case .default:
                    return nil
                case .custom(let value):
                    return value
            }
        }
    }
}
