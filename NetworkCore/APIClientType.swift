//
//  APIClientType.swift
//  APICore
//
//  Created by Vladyslav Siedov on 15/03/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import PromiseKit

public protocol APIClientType {
    func send<Request: APIRequestType>(_ request: Request) -> Promise<Request.Decoder.Response>
}
