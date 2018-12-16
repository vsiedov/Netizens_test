//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 13/03/2018.
//


import Foundation

public protocol Identifying {
    static var identifier: String { get }
}

public extension Identifying {
    static var identifier: String {
        return String(describing: self)
    }
}
