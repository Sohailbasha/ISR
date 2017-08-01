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
            ArticleController.fetchArticleFor(source: source, completion: { (article) in
                self.articles = article
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
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
    @IBOutlet var textViewOutlet: UITextView!
    

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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visableRect = CGRect()
        visableRect.origin = collectionView.contentOffset
        visableRect.size = collectionView.bounds.size
        
        let visablePoint = CGPoint(x: visableRect.midX, y: visableRect.midY)
        guard let visableIndexPath: IndexPath = collectionView.indexPathForItem(at: visablePoint) else { return }
        

        let article = articles[visableIndexPath.row]
        
        self.currentArticle = article
        textViewOutlet.text = article.description
        
        print(visableIndexPath)
    }
    
}


















