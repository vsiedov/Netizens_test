//
//  APIResponseContainer.swift
//  API
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

public struct APIResponseContainer<RealResponse: Decodable>: Decodable {
    public let data: RealResponse
}
