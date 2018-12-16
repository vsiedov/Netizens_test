//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 13/03/2018.
//
import Foundation

public protocol Reusable: Identifying {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return identifier
    }
}
