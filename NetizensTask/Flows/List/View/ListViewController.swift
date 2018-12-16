//
//  ListViewController.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import UIKit
import Closures

final class ListViewController: StateViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = viewModel.tableViewDataSource
        }
    }
    
    private let noContentLabel: UILabel = .init()
    
    var viewModel: ListViewModelType! {
        didSet {
            viewModel.tableViewDataSource
                .onCellForRowAtIndexPath(strongify: self) { `self`, tableView, indexPath in
                    return self.cellForRow(at: indexPath)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.start()
    }
    
    private func setup() {
        noContentLabel.textAlignment = .center
        noContentLabel.font = UIFont.systemFont(ofSize: 10.0)
        tableView.backgroundView = noContentLabel
        
        tableView.register(ListCellView.self)
    }
    
    private func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCellView = tableView.dequeueReusableCell(for: indexPath)
        configure(cell, at: indexPath)
        return cell
    }
    
    private func configure(_ cell: ListCellView, at indexPath: IndexPath) {
        let item = viewModel.item(at: indexPath)
        cell.setupCell(title: item.title, url: item.imageURL)
    }
}

extension ListViewController: ListViewModelViewDelegate {
    func updateTableViewBackgroundText(_ text: String?) {
        noContentLabel.text = text
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}
