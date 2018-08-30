//
//  AppConstants.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable line_length

//
// MARK: - Private constants
//
let sampleKey = "54e5496eb75443aea29abca3eda6dbf6"
//
// MARK: - URLS
//
struct WebUrl {
    static let baseUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key={sampleKey}"
}

//ConerRadiusRatio is base ratio.It is used to determine radius according to different devices height.
let cornerRadiusRatio: CGFloat = 49.0/375.0
