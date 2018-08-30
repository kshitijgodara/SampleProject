//
//  ConfigurableCell.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
public protocol ConfigurableCell: ReusableCell {
    associatedtype GenericType
    func configure(_ item: GenericType, at indexPath: IndexPath)
}
