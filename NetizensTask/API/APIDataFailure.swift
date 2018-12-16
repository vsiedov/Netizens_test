//
//  APIDataFailure.swift
//  App
//
//  Created by Vladyslav Siedov on 16/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

enum APIDataFailure: Error {
    case connection
    case server
    case `internal`
    case mapping(missingKey: String)
}
