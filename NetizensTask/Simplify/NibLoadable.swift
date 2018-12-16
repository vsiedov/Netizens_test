//  ArchitectureCore
//
//  Created by Vladyslav Siedov on 13/03/2018.
//

import UIKit

public protocol NibLoadable: Identifying {
    static var nibName: String { get }
}

public extension NibLoadable {
    static var nibName: String {
        return identifier
    }
}

public extension NibLoadable where Self: UIView {
    static var nib: UINib {
        return .init(
            nibName: nibName,
            bundle: Bundle(for: self)
        )
    }
    
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil).first as? Self else {
            fatalError("Failure on loading view from nib!")
        }
        
        return view
    }
}
