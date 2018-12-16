//
//  AlertAction.swift
//  App
//
//  Created by Vladyslav Siedov on 08/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit

struct Alert {
    let title: String?
    let message: String
    let style: Style
    let actions: [Action]
    
    init(title: String, message: String, style: Style = .default, actions: [Action] = []) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }
    
    init(message: String, style: Style = .default, actions: [Action] = []) {
        self.title = nil
        self.message = message
        self.style = style
        self.actions = actions
    }
    
    enum Style {
        case failure
        case success
        case `default`
    }
    
    struct Action {
        let title: String
        let style: Style
        let handler: ActionHandler?
        
        init(title: String, style: Style = .default, handler: ActionHandler? = nil) {
            self.title = title
            self.style = style
            self.handler = handler
        }
        
        enum Style {
            case `default`
            case cancel
            case destructive
        }
    }
}
