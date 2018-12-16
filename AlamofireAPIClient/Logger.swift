//
//  Logger.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedov on 25/09/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation
import NetworkCore
import Alamofire
import TaskAPI

final class Logger {
    private static let enabled: Bool = true
    private static let shouldShowRawResponse: Bool = true
    
    static func print(_ request: URLRequest?) {
        guard let request = request else { return }
        guard enabled else { return }
        printSeparator()
        print(request: request)
        print(headers: request.allHTTPHeaderFields)
        print(body: request.httpBody)
        printSeparator()
    }

    static func printResponse(httpStatusCode: Int?, urlString: String?, internalError: Error?, rawResponse: Data?) {
        guard enabled else { return }
        printSeparator()
        printResponse(httpStatusCode: httpStatusCode ?? -1, urlString: urlString ?? "URL Request unknown")
        print(internal: internalError)
        print(rawResponse: rawResponse)
    }
    
    static func printResult(response: Decodable? = nil, error: Error? = nil) {
        Swift.print("DECODED RESPONSE")
        
        if let response = response {
            Swift.print("Successfully decoded to - \(String(describing: type(of: response)))")
        } else if let failure = error as? APIFailure {
            Swift.print(failure.loggerDescription)
        } else {
            Swift.print("Unknown")
        }
        printSeparator()
    }

    private static func printSeparator() {
        Swift.print("-------------------------------------------------------------------------------------------")
    }

    private static func print(request: URLRequest) {
        Swift.print("\(request.httpMethod ?? "HTTPMethod?") - \(request.url?.absoluteString ?? "RequestURL?")")
    }

    private static func print(headers: [String: String]?) {
        if let headers = headers {
            Swift.print("HEADERS: \(headers)")
        }
    }

    private static func print(body: Data?) {
        if let body = body, let parameters = String(data: body, encoding: .utf8) {
            Swift.print("PARAMETERS: \(parameters)")
        }
    }

    private static func printResponse(httpStatusCode: Int, urlString: String) {
        Swift.print("\(httpStatusCode) - \(urlString)")
    }

    private static func print(internal error: Error?) {
        if let error = error {
            Swift.print("INTERNAL ERROR\n - Description: \(error)\n - Localized: \(error.localizedDescription)")
        }
    }

    private static func print(rawResponse data: Data?) {
        Swift.print("RAW RESPONSE\n\(convert(data: data))")
    }
    
    private static func convert(data: Data?) -> String {
        guard shouldShowRawResponse else { return "Disabled" }
        guard let data = data else { return  "Undecodable" }
        guard let string = String(data: data, encoding: .utf8) else { return "Undecodable" }
        return string.isEmpty ? "Empty" : string
    }
}

// MARK: - CustomStringConvertible
private let indentation = "    "

private extension APIFailure {
    var loggerDescription: String {
        var description: String = "Failure."
        switch self {
            case .internal(let reason):
                description += reason.loggerDescription
            case .server(let reason):
                description += reason.loggerDescription
        }
        return description
    }
}

private extension APIFailure.Internal {
    var loggerDescription: String {
        var description: String = "Internal."
        switch self {
            case .unknown(let error):
                description += "Unknown: \(String(describing: error))"
            case .encoding(let error):
                description += "Encoding: \(error)"
            case .decoding(let error):
                description += "Decoding: \(error)"
            case .connection(let reason):
                description += "\(reason)"
        }
        return description
    }
}

private extension APIFailure.Internal.Connection {
    var loggerDescription: String {
        var description: String = "Connection: "
        switch self {
            case .timeout:
                description += "Timeout"
            case .lost:
                description += "Network connection lost"
        }
        return description
    }
}

private extension APIFailure.Server {
    var loggerDescription: String {
        return "Server(\n\(indentation)status: \(status),\n\(indentation)content: \(content)\n)"
    }
}

private extension APIFailure.Server.Content {
    var loggerDescription: String {
        switch self {
            case .error(let reason):
                return reason.loggerDescription
            case .invalid(let reason):
                return reason.loggerDescription
            case .unauthorized(let reason):
                return reason.loggerDescription
            case .unsupported(let reason):
                return reason.loggerDescription
            case .undecodable:
                return "Undecodable"
        }
    }
}

private extension APIFailure.Server.Content.Error {
    var loggerDescription: String {
        return "Error(code: \"\(code)\", message: \"\(message)\")"
    }
}

private extension APIFailure.Server.Content.Invalid {
    var loggerDescription: String {
        return "Invalid(message: \"\(message)\")"
    }
}

private extension APIFailure.Server.Content.Unauthorized {
    var loggerDescription: String {
        return "Unauthorized(error: \"\(error)\", description: \"\(description)\")"
    }
}

private extension APIFailure.Server.Content.Unsupported {
    var loggerDescription: String {
        var description: String = "Unsupported: "
        switch self {
            case .string(let string):
                description += string
        }
        return description
    }
}
