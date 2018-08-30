//
//  AppExtensions.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

extension URLComponents {
    static func generateUrl(urlString: String, params: [String: Any]) -> URL? {
        var urlComponents = URLComponents(string: urlString)
        var arrQueryItems = [URLQueryItem]()
        for (myKey, myValue) in params {
            let value = "\(myValue)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
            let queryItem = URLQueryItem(name: myKey, value: value)
            arrQueryItems.append(queryItem)
        }
        urlComponents?.queryItems = arrQueryItems
        return URL(string: (urlComponents?.url?.absoluteString.replacingOccurrences(of: "+", with: "%2B"))!)
    }
}

extension UISplitViewController {
    var primaryViewController: UIViewController? {
        return viewControllers.first
    }
    var secondaryViewController: UIViewController? {
        return viewControllers.count > 1 ? viewControllers[1] : nil
    }
}
