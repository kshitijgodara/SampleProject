//
//  TableViewDataSource.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

public typealias TableRowSelectionHandlerType = (IndexPath) -> Void
open class TableViewDataSource<Provider: CollectionDataProvider, Cell: UITableViewCell>: NSObject,
    UITableViewDataSource,
    UITableViewDelegate
where Cell: ConfigurableCell, Provider.T == Cell.GenericType {
    // MARK: - Delegates
    public var tableRowSelectionHandler: TableRowSelectionHandlerType?
    // MARK: - Private Properties
    let provider: Provider
    let tableView: UITableView
    // MARK: - Lifecycle
    init(tableView: UITableView, provider: Provider) {
        self.tableView = tableView
        self.provider = provider
        super.init()
        setUp()
    }
    func setUp() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    public func  numberOfSections(in tableView: UITableView) -> Int {
        return provider.numberOfSections()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provider.numberOfRows(in: section)
    }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell
            else {
                return UITableViewCell()
        }
        let row = provider.row(at: indexPath)
        if let row = row {
            cell.configure(row, at: indexPath)
        }
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableRowSelectionHandler?(indexPath)
    }
}
