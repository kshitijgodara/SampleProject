//
//  ArrayDataProvider.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

public class ArrayDataProvider<T>: CollectionDataProvider {
    // MARK: - Internal Properties
    var items: [T] = []
    // MARK: - Lifecycle
    init(array: [T]) {
        items = array
    }
    // MARK: - CollectionDataProvider
    public func numberOfSections() -> Int {
        return 1
    }
    public func numberOfRows(in section: Int) -> Int {
        guard section >= 0 && section < items.count else {
            return 0
        }
        return items.count
    }
    public func row(at indexPath: IndexPath) -> T? {
        guard indexPath.section >= 0 && indexPath.section < items.count &&
            indexPath.row >= 0 && indexPath.row < items.count else {
                return nil
        }
        return items[indexPath.row]
    }
}
