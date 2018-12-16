//
//  GetPlaceholderPicResponse.swift
//  TaskAPI
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

public struct GetPlaceholderPicResponse: Decodable {
    public let albumId: Int?
    public let id: Int?
    public let title: String?
    public let url: String?
    public let thumbnailUrl: String?
}
