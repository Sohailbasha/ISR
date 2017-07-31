//
//  SourceController.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class SourceController {
    
    let sharedInstance = SourceController()
    
    
    static let sourceURL = URL(string: "https://newsapi.org/v1/sources?category=sport")
    
    static func fetchSources(completion: @escaping (_ sources: [Source]) -> Void) {
        
        guard let url = sourceURL else { fatalError("URL Optional is nil") }
        
        NetworkController.performRequest(for: url, httpMethod: .get, urlParameters: nil, body: nil) { (data, error) in
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {
                    print("No data returned from network request.")
                    completion([])
                    return
            }
            
            
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:AnyObject],
                let sourceDictionary = jsonDictionary["sources"] as? [[String:AnyObject]] else { print("unable to serialize Json. \nresponse: \(responseDataString)")
                    completion([])
                    return
            }

            
            let sources = sourceDictionary.flatMap {Source(dictionary: $0)}
            completion(sources)
 
        }
    }
    
    
    
    
    
}
