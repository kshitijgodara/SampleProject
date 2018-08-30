//
//  NewsFeedModel.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 30/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
struct NewsFeedModel: Codable {
    let status, copyright: String
    let numResults: Int
    let articles: [Article]
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case articles = "results"
    }
}
struct Article: Codable {
    let url, adxKeywords: String
    let column: String?
    let section, byline: String
    let type: ArticleType
    let title, abstract, publishedDate: String
    let source: Source
    let resultId, assetID, views: Int
    let desFacet: [String]
    let orgFacet, perFacet, geoFacet: Facet
    let media: [Media]
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source
        case resultId = "id"
        case assetID = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
    }
}

enum Facet: Codable {
    case string(String)
    case stringArray([String])
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let xElement = try? container.decode([String].self) {
            self = .stringArray(xElement)
            return
        }
        if let xElement = try? container.decode(String.self) {
            self = .string(xElement)
            return
        }
        throw DecodingError.typeMismatch(Facet.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for Facet"))
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let xElement):
            try container.encode(xElement)
        case .stringArray(let xElement):
            try container.encode(xElement)
        }
    }
}

struct Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
}

enum Format: String, Codable {
    case jumbo = "Jumbo"
    case large = "Large"
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case normal = "Normal"
    case square320 = "square320"
    case square640 = "square640"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
}

enum Subtype: String, Codable {
    case photo
}

enum MediaType: String, Codable {
    case image
}

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
}

enum ArticleType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}
