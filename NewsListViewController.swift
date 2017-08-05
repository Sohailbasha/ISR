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
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if let source = source {
            ArticleController.fetchArticleFor(source: source, completion: { (articles) in
                self.articles = articles
                DispatchQueue.main.async {
                    self.currentArticle = articles.first
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    
    // MARK: - Properties
    
    var source: Source?
    var articles: [Article] = []
    
    var currentArticle: Article?
    
    
    // MARK: - OUtlets
    
    @IBOutlet var tableView: UITableView!
    

}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleDetailTableViewCell
        let story = articles[indexPath.row]
        cell?.updateCellWith(story: story)
        return cell ?? UITableViewCell()
    }
    
    
    
}












