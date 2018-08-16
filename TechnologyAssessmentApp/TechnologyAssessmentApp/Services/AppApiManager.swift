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
    func getArticlesList(completionHandler: @escaping (_ articleList: [ArticleViewModel]?, _ error: AppError?)
        -> Void) {
        let networkClient = AppNetworkClient.sharedInstance
        let url = WebUrl.baseUrl.replacingOccurrences(of: "{section}", with: "all-sections")
            .replacingOccurrences(of: "{period}", with: "7")
            .replacingOccurrences(of: "{sampleKey}", with: sampleKey)
        networkClient.getDataFor(baseUrl: url, responseType: .json, endPoint: "", params: nil) { (json, customError) in
            if customError == nil, let response = json as? [String: Any], response["status"] as? String == "OK" {
                if let networkArticles = response["results"] as? [[String: Any]] {
                    var articles: [ArticleViewModel] = []
                    // Create article objects out of a JSON object
                    for networkArticle in networkArticles {
                        let article = ArticleViewModel(jsonObject: networkArticle)
                        articles.append(article)
                    }
                    completionHandler(articles, nil)
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
