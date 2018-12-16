//
//  StateViewController.swift
//  App
//
//  Created by Vladyslav Siedov on 15/10/2018.
//  Copyright © 2018 The Software House. All rights reserved.
//

import UIKit
import MBProgressHUD

class StateViewController: UIViewController {
    private(set) var state: State = .idle
}

// MARK: - Types
extension StateViewController {
    enum State {
        case idle
        case loading(MBProgressHUD)
        case popup(Alert, UIAlertController)
    }
}

// MARK: - ProgressShowing
extension StateViewController: ProgressShowing {
    func showIndicator(animated: Bool) {
        switch state {
            case .idle:
                state = .loading(.showAdded(to: view, animated: animated))
            case .loading, .popup:
                return
        }
    }
    
    func hideIndicator(animated: Bool) {
        switch state {
            case .idle, .popup:
                return
            case .loading(let hud):
                hud.hide(animated: animated)
        }
    }
}

// MARK: - PopupShowing
extension StateViewController: PopupShowing {
    func showPopup(with alert: Alert, animated: Bool) {
        switch state {
            case .idle:
                break
            case .loading(let hud):
                hud.hide(animated: animated)
            case .popup(_, let controller):
                controller.parent?.dismiss(animated: animated)
        }
        
        let alertController: UIAlertController = UIAlertControllerFactory.makeAlertController(alert: alert)
        present(alertController, animated: animated)
        state = .popup(alert, alertController)
    }
}
