//
//  APIResponseDecoding.swift
//  APICore
//
//  Created by Vladyslav Siedov on 16/03/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

public enum APIRequestParameters {
    case none
    /// Url-encoded query string at the specified destination
    case url(Parameters, Destination)
    /// JSON parameters object
    case json(Parameters)
}

extension APIRequestParameters {
    public typealias Parameters = [String: Any]
    
    /// Defines whether the url-encoded query string is applied to the existing query string or HTTP body of the resulting URL request.
    ///
    /// - methodDependent: Applies encoded query string result to existing query string for GET, HEAD and DELETE requests and sets as the HTTP body for requests with any other HTTP method.
    /// - queryString: Sets encoded query string result to existing query string.
    /// - httpBody: Sets encoded query string result as the HTTP body of the URL request.
    public enum Destination {
        /// Applies encoded query string result to existing query string for GET, HEAD and DELETE requests and sets as the HTTP body for requests with any other HTTP method.
        case methodDependent
        /// Sets encoded query string result to existing query string.
        case queryString
        /// Sets encoded query string result as the HTTP body of the URL request.
        case httpBody
    }
}
