//
//  APIResponseDecoding.swift
//  APICore
//
//  Created by Vladyslav Siedov on 16/03/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

public protocol APIResponseDecoding {
    associatedtype Response: Decodable
    
    static func decode(data: Data?, status: HTTPStatus?, error: Error?) throws -> Response
}
