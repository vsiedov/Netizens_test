//
//  ListRequest.swift
//  TaskAPI
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import NetworkCore

public class Get: APIRequestType {
    public typealias Decoder = APIDecoder<GetRestaurantsListResponse>
    
    public let method: HTTPMethod = .get
    public let path: String = "/photos"
    public var isRequireAuthorization: Bool = false
    public let parameters: APIRequestParameters
    
    public init() {
        self.parameters = nil
    }
}
