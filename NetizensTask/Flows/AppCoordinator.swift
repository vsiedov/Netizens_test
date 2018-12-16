//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 21/09/2018.
//

import UIKit
//import NetworkCore
import Closures

typealias ActionHandler = () -> Void

final class AppCoordinator {
    private let window: UIWindow
    private let api: TestAPI
    private let tabBarController: UITabBarController = .init()
    
    private var list: ListCoordinator!
    
    init(window: UIWindow, api: TestAPI) {
        self.window = window
        self.api = api
    }
    
    func start() {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        tabBarController.viewControllers = [
            startListFlow()
        ]
    }
}

extension AppCoordinator {
    private func startListFlow() -> UINavigationController {
        let navigationController = makeListNavigationController()
        let coordinator: ListCoordinator = .init(navigationController: navigationController, api: api)
        coordinator.start()
        list = coordinator
        return navigationController
    }
    
    private func makeListNavigationController() -> UINavigationController {
        let navigationController: UINavigationController = .init()
        navigationController.tabBarItem.title = "Image List"
        navigationController.tabBarItem.image = UIImage.init(named: "nav_item")
        return navigationController
    
    }
}
