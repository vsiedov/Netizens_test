//
//  HTTPURLResponse+HTTPStatus.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedov on 25/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore

extension HTTPURLResponse {
    var status: HTTPStatus? {
        return HTTPStatus(rawValue: statusCode)
    }
}
