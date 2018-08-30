//
//  AppError.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

enum AppErrorType: Int {
    case notReachable
    case invalidStatusCode
    case invalidUrl
    case invalidResponseFormat
    case apiFailed
    case dataNotFound
}

class AppError: NSObject {
    var errorType: AppErrorType
    var errorCode: Int?
    var errorDesciption: String?
    override var description: String {
        var desc = "Error Type= \(errorType)"
        if let code = errorCode {
            desc.append(", Error Code= \(code)")
        }
        if let errorDesc = errorDesciption {
            desc.append(", Error Description= \(errorDesc)")
        }
        return desc
    }
    init(type: AppErrorType, description: String = "", code: Int = 0) {
        errorType = type
        errorCode = code
        errorDesciption = description
    }
}
