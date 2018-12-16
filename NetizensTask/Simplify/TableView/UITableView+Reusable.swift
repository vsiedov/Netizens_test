//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 13/03/2018.
//

import UIKit

public extension UITableView {
    func register<T: TableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: TableViewNibCell>(_: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: TableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue \(String(describing: T.self)) with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func register<T: TableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: TableViewNibHeaderFooterView>(_: T.Type) {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooter<T: TableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue \(String(describing: T.self)) with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
