//
//  HTTPMethod.swift
//  APICore
//
//  Created by Vladyslav Siedov on 15/03/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//
//  https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods

import Foundation

/// HTTPMethod is a set of request methods to indicate the desired action to be performed for a given resource
public enum HTTPMethod {
    /// GET method requests a representation of the specified resource. Requests using GET should only retrieve data
    case get
    /// HEAD method asks for a response identical to that of a GET request, but without the response body
    case head
    /// POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server
    case post
    /// PUT method replaces all current representations of the target resource with the request payload
    case put
    /// DELETE method deletes the specified resource
    case delete
    /// CONNECT method establishes a tunnel to the server identified by the target resource
    case connect
    /// OPTIONS method is used to describe the communication options for the target resource
    case options
    /// TRACE method performs a message loop-back test along the path to the target resource
    case trace
    /// PATCH method is used to apply partial modifications to a resource
    case patch
}
