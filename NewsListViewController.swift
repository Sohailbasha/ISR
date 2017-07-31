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
    
    var source: Source?
    
    var articles: [Article] = []
    
    @IBOutlet var collectionView: UICollectionView!


}


extension NewsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as? StoryCollectionViewCell
        
        
        return cell ?? UICollectionViewCell()
    }
    
    
}


















