//
//  APIRequestType.swift
//  APICore
//
//  ź
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

public protocol APIRequestType {
    associatedtype Decoder: APIResponseDecoding
    
    var method: HTTPMethod { get }
    var path: String { get }
    var isRequireAuthorization: Bool { get }
    var parameters: APIRequestParameters { get }
}
