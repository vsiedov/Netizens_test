//
//  ListViewModel.swift
//  NetizensTask
//
//  Created by Vladyslav Siedov on 09/12/2018.
//  Copyright © 2018 Vladyslav Siedov. All rights reserved.
//

import Foundation
import Closures

final class ListViewModel {
    
    var tableViewDataSource: TableViewDataSourceType {
        return dataSource
    }
    
    private let concurrentRealmQueue = DispatchQueue(label: "com.netizens.NetizensTask.realmQueue")
    
    private let dataSource: ListDataSourceType
    private let dataProvider: ListDataProviderDelegate
    
    private weak var view: ListViewModelViewDelegate!
    
    private var didSelectItemHandler: DidSelectItemHandler?
    
    init(view: ListViewModelViewDelegate, dataSource: ListDataSource, dataProvider: ListDataProviderDelegate) {
        self.view = view
        self.dataSource = dataSource
        self.dataProvider = dataProvider
    }
}


extension ListViewModel: ListViewModelType {
    func didSelectRow(at indexPath: IndexPath) {
        let item = dataSource.item(at: indexPath)
        didSelectItemHandler?(item)
    }
    
    
    func start() {
        updateList()
    }
    
    func item(at indexPath: IndexPath) -> ListViewData {
        let item = dataSource.item(at: indexPath)
        return .init(item: item)
    }
    
    func updateList() {
        view.showIndicator(animated: true)
        dataProvider
            .getItemsList()
            .get { [weak self] (value) in
                guard let self = self else { return }
                self.saveToDateBase(items: value)
            }
            .done { [weak self] (value) in
                guard let self = self else { return }
                self.dataSource.update(value)
                self.view?.reloadTableView()
            }
            .ensure { [weak self] in
                guard let self = self else { return }
                self.view.hideIndicator(animated: true)
                self.updateTableViewBackgroundText()
            }
            .catch { [weak self] (error) in self?.handleGetListFailure(error) }
    }
}

//MARK: Realm
extension ListViewModel {
    private func saveToDateBase(items: PicItems) {
        dataProvider.saveItems(items: items)
    }
}

extension ListViewModel {
    typealias DidSelectItemHandler = (PicItem) -> Void
    
    @discardableResult
    func onDidSelectItem(_ handler: @escaping DidSelectItemHandler) -> Self {
        didSelectItemHandler = handler
        return self
    }
}


//MARK: Error Handling
extension ListViewModel {
    private func handleGetListFailure(_ error: Error) {
        view.showPopup(with: alert(for: error), animated: true)
    }
    
    private func updateTableViewBackgroundText() {
        view.updateTableViewBackgroundText(dataSource.isEmpty() ? "No images" : nil)
    }
    
    private func alert(for error: Error) -> Alert {
        guard let failure = error as? APIDataFailure else { return .generalConnectionFailure }
        switch failure {
        case .connection:
            return .generalConnectionFailure
        case .internal, .mapping, .server:
            return .errorListDownload
        }
    }
}
