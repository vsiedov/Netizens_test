//
//  ListCoordinator.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 10/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final class ListCoordinator {
    var onDidFinish: ActionHandler?
    
    private let navigationController: UINavigationController
    private let api: TestAPI
    private let realm = try! Realm()
    init(navigationController: UINavigationController, api: TestAPI) {
        self.navigationController = navigationController
        self.api = api
    }
    
    func start() {
        let view = makeListScene()
        showAsRoot(view, animated: false)
    }
    
    func finish() {
        onDidFinish?()
    }
}

// MARK: - Scene Factory
extension ListCoordinator {
    private func makeListScene() -> ListViewController {
        let view: ListViewController = .instantiateFromStoryboard()
        let dataSource: ListDataSource = .init()
        let provider: ListDataProvider = .init(apiClient: api.client, realmClient: realm)
        let viewModel: ListViewModel = .init(view: view, dataSource: dataSource, dataProvider: provider)
        view.viewModel = viewModel
        viewModel.onDidSelectItem { (item) in
            print("Did Select: \(item.title)")
        }
        return view
    }
}

// MARK: - Navigation
extension ListCoordinator {
    private func showAsRoot(_ view: UIViewController, animated: Bool) {
        navigationController.setViewControllers([view], animated: animated)
    }
}
