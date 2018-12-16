//
//  NetworkActivityIndicatorVisibilityProvider.swift
//  AlamofireAPIClient
//
//  Created by Vladyslav Siedovi on 12/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import Foundation

final class NetworkActivityIndicatorVisibilityProvider {
    var isShown: Bool {
        set { update(isShown: newValue) }
        get { return counter > 0 }
    }
    
    private var counter: Int = 0
    
    func show() {
        isShown = true
    }
    
    func hide() {
        isShown = false
    }
    
    private func update(isShown: Bool) {
        counter += isShown ? 1 : -1
        counter = max(counter, 0)
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = self.isShown
        }
    }
}
