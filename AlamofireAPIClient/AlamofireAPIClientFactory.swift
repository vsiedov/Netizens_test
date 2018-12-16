//
//  AlamofireAPIClientFactory.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedov on 24/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore
import Alamofire
import TaskAPI

public final class AlamofireAPIClientFactory {
    private static var defaultSessionManager: SessionManager {
        let configuration: URLSessionConfiguration = .default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return .init(configuration: configuration)
    }
    
    public static func makeAPI(configuration: APIClientConfiguration) -> API {
    
        let sessionManager: SessionManager = defaultSessionManager
        
        let apiClient: AlamofireAPIClient = .init(
            serverURLComponents: configuration.asURLComponents(),
            sessionManager: sessionManager
        )
        
        return .init(client: apiClient)
    }
    
    private static func makeAPIClient(configuration: APIClientConfiguration) -> APIClientType {
        return AlamofireAPIClient(
            serverURLComponents: configuration.asURLComponents(),
            sessionManager: defaultSessionManager
        )
    }
}

private extension APIClientConfiguration {
    func asURLComponents() -> URLComponents {
        var urlComponents: URLComponents = .init()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.port = port.value
        return urlComponents
    }
}
