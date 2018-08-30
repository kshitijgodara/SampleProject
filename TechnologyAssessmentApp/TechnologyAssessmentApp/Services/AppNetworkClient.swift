//
//  AppNetworkClient.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation

// swiftlint:disable vertical_parameter_alignment

typealias CompletionBlock = (_ response: Any?, _ error: AppError?) -> Void

enum ResponseType: Int {
    case json = 1
    case string = 2
}

private let defaultStatusCode = 0

class AppNetworkClient: NSObject {
    //
    // MARK: - Shared instance property
    //
    static let sharedInstance = AppNetworkClient()
    //
    // MARK: - instance properties
    //
    var task: URLSessionDataTask?
    //
    // MARK: - private init
    //
    private override init() {
        super.init()
    }

    // Load articles over the network with a default completion block provided by URLSession
    func getDataFor(baseUrl: String = WebUrl.baseUrl, responseType: ResponseType = .json,
                    endPoint: String="", params: [String: Any]?,
         completionHandler: @escaping CompletionBlock) {
        var url: URL?
        if let encodedString = (baseUrl + endPoint).addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed),
            var urlComponents = URLComponents(string: encodedString) {
            if let queryItems = urlComponents.queryItems {
                urlComponents.queryItems = queryItems
            }
            url = urlComponents.url
            if let parameters = params, parameters.count > 0,
                let urlString = url?.absoluteString {
                url = URLComponents.generateUrl(urlString: urlString, params: parameters)
            }
        }
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            // Create a dataTask with a closure that defines the comletion handler
            // The closure in this case is defined as completionHandler: { (data, response, error) in  ... }
            networkCallFor(request: request, responseType: responseType, completionBlock: completionHandler)
        } else {
            let error = AppError.init(type: .invalidUrl,
                                      description: "Could not generate URL for given end point and parameters")
            completionHandler(nil, error)
        }
    }
}

extension AppNetworkClient {
    fileprivate func networkCallFor(request: URLRequest,
                                    responseType: ResponseType = .json, completionBlock: @escaping CompletionBlock) {
        var newRequest = request
        newRequest.timeoutInterval = 30
        newRequest.cachePolicy = .reloadIgnoringLocalCacheData
        URLSession.shared.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        // Ensure that an error is not present, otherwise, return the error

        task = session.dataTask(with: newRequest, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                        var customError: AppError?
                        var receivedResponse: Any?
                        if let receivedData = data {
                            if responseType == .json {
                                do {
                                    // Ensure that the network data is available and
                                    // that the byte count is greater that zero
                                    if let jsonString = String.init(data:
                                        receivedData, encoding:
                                        String.Encoding.utf8)?.removingPercentEncoding,
                                        let jsonData = jsonString.data(using: .utf8) {
                                        // Perform the JSONSerialization into an array of Dictionaries
                                        // Next use the convenience constructor in Article to
                                        // create an Article object out of each object in the JSON array
                                        receivedResponse = jsonData
                                    }
                                }
                            } else if responseType == .string {
                                // Ensure that the network data is available
                                // and that the byte count is greater that zero
                                receivedResponse = String(data: receivedData, encoding: .utf8)
                            }
                        }
                        if let httpResponse = response as? HTTPURLResponse {
                            let statusCode = httpResponse.statusCode
                            if !(200 ... 299 ~= statusCode) {
                                customError = AppError.init(type: .invalidStatusCode, code: statusCode)
                            }
                        } else {
                            if Reachability.isConnectedToNetwork() == false {
                                customError = AppError.init(type: .notReachable, description: UIMessages.noInternet)
                            } else {
                                customError = AppError.init(type:
                                    .apiFailed, description:
                                    error?.localizedDescription ?? UIMessages.apiTimedOut)
                            }
                        }
                        customError?.errorCode = statusCode
                        completionBlock(receivedResponse, customError)
                }
        })
        task?.resume()
    }
    func cancelNetworkCall() {
        task?.cancel()
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

extension AppNetworkClient: URLSessionDelegate {
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
