//
//  ArticleController.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class ArticleController {
    
    static let sharedInstance = ArticleController()
    static let baseURL = URL(string: "https://newsapi.org/v1/articles")
    static let apiKey = "1fb14fda4d59496c8d0678093e9dbc02"
    
    static func fetchArticleFor(source: Source, completion: @escaping (_ articles: [Article]) -> Void) {
        
        guard let url = baseURL else { fatalError("URL Optional is nil") }
        let urlParameters = ["source":"\(source.id)", "sortBy":"latest", "apiKey":"\(apiKey)"]
        
        NetworkController.performRequest(for: url, httpMethod: .get, urlParameters: urlParameters) { (data, error) in
            guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                print("No data returnd from network request.")
                completion([])
                return
            }
            
        
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:AnyObject],
                let articleDictionary = jsonDictionary["articles"] as? [[String:AnyObject]] else { print("unable to serialize Json. \nresponse: \(responseString)")
                    completion([])
                    return
                    
            }
            
            let articles = articleDictionary.flatMap {Article(dictionary: $0)}
            completion(articles)
 
        }
        
    }
    
    
}
