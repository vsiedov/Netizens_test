//
//  Alert+Generall.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//


import Foundation

extension Alert {
    static var generalConnectionFailure: Alert {
        return .init(
            message: "Connection failure. Please try again later.",
            style: .failure
        )
    }
    
    static var errorListDownload: Alert {
        return .init(
            message: "Error list download. Please try again.",
            style: .failure
        )
    }
}
