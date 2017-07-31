//
//  NetworkController.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        // creating your own type for httpMethod
        case get = "GET"
        case put = "PUT" //upload a representation
        case post = "POST" //submit data to be processed
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    // Make network call
    static func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String : String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        // Here we are creating our url that we are requesting data from
        let requestURL = self.url(bbyAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        // dataTask brings us our data from our specified URL
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        dataTask.resume()
        // get it to start working with .resume()
    }
    
    // This func creates and formats a url. Is being called in "var request ="
    static func url(bbyAdding parameters: [String : String]?, to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.flatMap({URLQueryItem(name: $0.0, value: $0.1)})
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}
