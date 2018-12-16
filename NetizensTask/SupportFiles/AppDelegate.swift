//
//  AppDelegate.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareWindow()
        return true
    }
    
    private func prepareWindow() {
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        self.window = window
        
        let appCoordinator: AppCoordinator = makeAppCoordinator(with: window)
        self.appCoordinator = appCoordinator
        
        appCoordinator.start()
    }
    
    private func makeAppCoordinator(with window: UIWindow) -> AppCoordinator {
        return .init(
            window: window,
            api: TestAPIFactory.makeAPI(configuration: .staging)
        )
    }
}

