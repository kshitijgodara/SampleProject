//
//  ArticleViewModel.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 16/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    public var abstract: String?
    public var dateString: String?
    public var byLine: String?
    public var URLLink: String?
    public var imageUrl: String?
    //
    // MARK: - Private Instance Property
    //
    private let networkKeyMap: [String: String] = ["abstract": "abstract",
                                                   "published_date": "published_date",
                                                   "byline": "byline",
                                                   "url": "url",
                                                   "media": "media"]
   public init(jsonObject: [String: Any]) {
        // Parse network objects based upon a network key-value mapping schema
        for (key, value) in networkKeyMap {
            if key == "media" {
                if let mediaDict = jsonObject[value] as? [[String: Any]],
                    let mediaMetaData = mediaDict[0]["media-metadata"] as? [[String: Any]],
                    mediaMetaData.isEmpty == false {
                    for dict in mediaMetaData {
                        //Here compiler know type of statusDict is [String:Any]
                        if let format = dict["format"] as? String, format == "Standard Thumbnail",
                            let imageUrl =  dict["url"] as? String {
                            self.imageUrl = imageUrl
                            break
                        }
                    }
                }
            } else {
                if let networkObject = jsonObject[value] as? String {
                    if key == "abstract" {
                        abstract = networkObject
                    }
                    if key == "byline" {
                        byLine = networkObject
                    }
                    if key == "published_date" {
                       dateString = networkObject
                    }
                    if key == "url" {
                        URLLink = networkObject
                    }
                }
            }
        }
    }
}
