//
//  ListDataProvider.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import PromiseKit
import TaskAPI
import NetworkCore
import RealmSwift

final class ListDataProvider {
    private let apiClient: APIClientType
    private let realmClient: Realm
    
    init(apiClient: APIClientType, realmClient: Realm) {
        self.apiClient = apiClient
        self.realmClient = realmClient
    }
}

extension ListDataProvider: ListDataProviderDelegate {
    func getItemsList() -> Promise<PicItems> {
        
        let request: GetPlaceholderPicRequest = .init()
        
        return Promise { seal in
            apiClient.send(request)
                .then { Guarantee.value($0) }
                .then { PicItemMapper.makeItems($0)}
                .done { seal.fulfill($0) }
                .catch { seal.reject(APIDataFailureMapper.map(error: $0)) }
        }
    }
    
    func saveItems(items: PicItems) {
        try! realmClient.write {
            realmClient.add(PicItemRealmObjectMapper.makeItems(items))
        }
    }
}
