//
//  NewsListViewController.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        if let source = source {
            ArticleController.fetchArticleFor(source: source, completion: { (articles) in
                self.articles = articles
                DispatchQueue.main.async {
                    

                    self.currentArticle = articles.first
                }
            })
        }
    }
    
    
    // MARK: - Properties
    
    var source: Source?
    var articles: [Article] = []
    
    var currentArticle: Article?
    
    
    // MARK: - OUtlets
    
    

}
















