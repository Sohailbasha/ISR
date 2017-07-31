//
//  Article.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit


struct Article {
    
    private let authorKey = "author"
    private let titleKey = "title"
    private let descriptionKey = "description"
    private let urlKey = "url"
    private let urlToImageKey = "urlToImage"
    
    
    
    let author: String
    let title: String
    let description: String
    let url: String
    let imageEndPoint: String
    
    
    init?(dictionary: [String:Any]) {
        guard let author = dictionary[authorKey] as? String, let title = dictionary[titleKey] as? String, let description = dictionary[descriptionKey] as? String, let url = dictionary[urlKey] as? String, let imageEndPoint = dictionary[urlToImageKey] as? String else { return nil }
        
        
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.imageEndPoint = imageEndPoint
        
    }
    
    
    
}
