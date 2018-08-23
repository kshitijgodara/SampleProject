//
//  CollectionArrayDataSource.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit
class CollectionArrayDataSource<T, Cell: UITableViewCell>: TableViewDataSource<ArrayDataProvider<T>, Cell>
where Cell: ConfigurableCell, Cell.GenericType == T {
    // MARK: - Lifecycle
    public convenience init(tableView: UITableView, array: T) {
        self.init(tableView: tableView, array: [array])
    }
    public  init(tableView: UITableView, array: [T]) {
        let provider = ArrayDataProvider(array: array)
        super.init(tableView: tableView, provider: provider)
    }
    // MARK: - Public Methods
    public func row(at indexPath: IndexPath) -> T? {
        return provider.row(at: indexPath)
    }
}
