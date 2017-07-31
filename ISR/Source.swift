//
//  Source.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

struct Source {
    
    private let idKey = "id"
    private let nameKey = "name"
    private let descriptionKey = "description"
    
    let id: String
    let name: String
    let description: String
    
    
    
    
    init?(dictionary: [String:Any]) {
//        if let id = dictionary[idKey] as? String, let name = dictionary[nameKey] as? String, let description = dictionary[descriptionKey] as? String {
//            self.id = id
//            self.name = name
//            self.description = description
//        }
        
        guard  let id = dictionary[idKey] as? String, let name = dictionary[nameKey] as? String, let description = dictionary[descriptionKey] as? String else {
            return nil }
        
        self.id = id
        self.name = name
        self.description = description
        
    }
    
    
    
    
}
