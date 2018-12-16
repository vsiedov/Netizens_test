//
//  AlamofireAPIClient.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedov on 21/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore
import PromiseKit
import Alamofire

public final class AlamofireAPIClient : APIClientType {
    private let serverURLComponents: URLComponents
    private let sessionManager: SessionManager
    private let networkActivityIndicator: NetworkActivityIndicatorVisibilityProvider = .init()
    
    init(serverURLComponents: URLComponents, sessionManager: SessionManager) {
        self.serverURLComponents = serverURLComponents
        self.sessionManager = sessionManager
    }
    
    public func send<Request: APIRequestType>(_ request: Request) -> Promise<Request.Decoder.Response> {
        return Promise { seal in
            self.networkActivityIndicator.show()
            let request = makeDataRequest(for: request)
            Logger.print(request.request)
            request.validate().responseData { response in
                self.networkActivityIndicator.hide()
                Logger.printResponse(
                    httpStatusCode: response.response?.statusCode,
                    urlString: response.request?.url?.absoluteString,
                    internalError: response.error,
                    rawResponse: response.data
                )
                do {
                    let decoded = try Request.Decoder.decode(data: response.data, status: response.response?.status, error: response.error)
                    Logger.printResult(response: decoded)
                    seal.fulfill(decoded)
                } catch {
                    Logger.printResult(error: error)
                    seal.reject(error)
                }
            }
        }
    }
    
    private func makeDataRequest<Request: APIRequestType>(for request: Request) -> DataRequest {
        let (parameters, encoding) = makeParameters(for: request.parameters)
        
        return sessionManager.request(
            makeURL(for: request.path),
            method: request.method.asAlamofireHTTPMethod(),
            parameters: parameters,
            encoding: encoding,
            headers: nil
        )
    }
    
    private func makeURL(for path: String) -> URL {
        var components: URLComponents = serverURLComponents
        components.path = "/\(path)"
        return try! components.asURL()
    }
    
    private func makeParameters(for parameters: APIRequestParameters) -> (Parameters?, ParameterEncoding) {
        switch parameters {
            case .none:
                return (nil, URLEncoding.default)
            case .url(let parameters, let destination):
                return (parameters, URLEncoding(destination: destination.asAlamofireURLEncodingDestination()))
            case .json(let parameters):
                return (parameters, JSONEncoding())
        }
    }
}

private extension NetworkCore.HTTPMethod {
    func asAlamofireHTTPMethod() -> Alamofire.HTTPMethod {
        switch self {
            case .get:      return .get
            case .head:     return .head
            case .post:     return .post
            case .put:      return .put
            case .delete:   return .delete
            case .connect:  return .connect
            case .options:  return .options
            case .trace:    return .trace
            case .patch:    return .patch
        }
    }
}

private extension APIRequestParameters.Destination {
    func asAlamofireURLEncodingDestination() -> URLEncoding.Destination {
        switch self {
            case .methodDependent:  return .methodDependent
            case .queryString:      return .queryString
            case .httpBody:         return .httpBody
        }
    }
}
