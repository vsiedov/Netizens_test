//
//  ListCellView.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

final class ListCellView: TableViewNibCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var picView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        picView.image = nil
    }
    
    private func setupStyle() {
        picView.layer.cornerRadius = picView.frame.height / 2
    }
    
    func setupCell(title: String,
                   url: URL) {
        titleLabel.text = title
        picView.kf.setImage(with: url)
    }

}
