//
//  AppApiManager.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit
import Foundation

class AppApiManager: NSObject {
    func getArticlesList(completionHandler: @escaping (_ articleList: ArticleViewModel?, _ error: AppError?)
        -> Void) {
        let networkClient = AppNetworkClient.sharedInstance
        let url = WebUrl.baseUrl.replacingOccurrences(of: "{section}", with: "all-sections")
            .replacingOccurrences(of: "{period}", with: "7")
            .replacingOccurrences(of: "{sampleKey}", with: sampleKey)
        networkClient.getDataFor(baseUrl: url,
                                 responseType: .json, endPoint: "", params: nil) {(jsonData, customError) in
            if customError == nil, let response = jsonData as? Data {
                let articleModel = try? JSONDecoder().decode(ArticleViewModel.self, from: response)
                if let article = articleModel, article.status == "OK" {
                    completionHandler(article, nil)
                } else {
                    let error = customError ?? AppError(type: AppErrorType.invalidResponseFormat,
                                                        description: "", code: 0)
                    completionHandler(nil, error)
                }
            } else {
                let error = customError ?? AppError(type: AppErrorType.dataNotFound, description: "", code: 0)
                completionHandler(nil, error)
            }
        }
    }
}
