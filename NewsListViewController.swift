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
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    
    // MARK: - Properties
    
    var source: Source?
    var articles: [Article] = []
    
    
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
        cell?.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1)
        return cell ?? UITableViewCell()
    }
    
    func getStringSizeForFont(font: UIFont, myText: String) -> CGSize {
        let fontAttributes = [NSFontAttributeName: font]
        let size = (myText as NSString).size(attributes: fontAttributes)
        return size
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let source = source {
            return source.name
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let articleDescription = articles[indexPath.row].description
        let articleTitle = articles[indexPath.row].title
        
        let descriptionSize = getStringSizeForFont(font: UIFont.systemFont(ofSize: 14), myText: articleDescription)
        let titleSize = getStringSizeForFont(font: UIFont.systemFont(ofSize: 17), myText: articleTitle)
        
        let tableViewWidth = tableView.frame.width
        let originalTextFieldHeight: CGFloat = 33
        let originalTitleHeight: CGFloat = 20.5
        
        let titleLines: CGFloat = CGFloat(ceil(Float(titleSize.width/tableViewWidth)))
        let articleLines: CGFloat = CGFloat(ceil(Float(descriptionSize.width/tableViewWidth)))
        
        let height = tableView.rowHeight - originalTextFieldHeight - originalTitleHeight + CGFloat(articleLines*descriptionSize.height) + CGFloat(titleLines*titleSize.height)
        
        return height
    }
    
    
}












