//
//  CollectionDataProvider.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

//swiftlint:disable all

public protocol CollectionDataProvider {
    associatedtype T
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func row(at indexPath: IndexPath) -> T?

}