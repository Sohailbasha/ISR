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
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let source = source {
            ArticleController.fetchArticleFor(source: source, completion: { (articles) in
                self.articles = articles
                DispatchQueue.main.async {
                    self.collectionView.reloadData()

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
    
    @IBOutlet var collectionView: UICollectionView!

}


extension NewsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? StoryCollectionViewCell
        let article = articles[indexPath.row]
        cell?.updateWith(article: article)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let height: CGFloat = screenSize.height
        let width: CGFloat = screenSize.width
        
        
        return CGSize(width: width - (width * 0.4), height: height*0.3)
    }
    
}


















