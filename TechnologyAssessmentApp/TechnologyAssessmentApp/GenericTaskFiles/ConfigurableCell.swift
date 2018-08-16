//
//  ConfigurableCell.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

//swiftlint:disable all

public protocol ConfigurableCell: ReusableCell
{
    associatedtype T
    
    func configure(_ item: T, at indexPath: IndexPath)
}
