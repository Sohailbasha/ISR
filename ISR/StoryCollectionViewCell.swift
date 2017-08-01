//
//  StoryCollectionViewCell.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 20
    }
    
    
    
    
    func updateWith(article: Article) {
        
        DispatchQueue.main.async {
            self.titleOutlet.text = article.title
//            self.authorOutlet.text = article.author
//            self.textView.text = article.description
        }
        
        ImageController.image(forURL: article.imageEndPoint, completion: { (articleImage) in
            if let image = articleImage {
                self.imageView.image = image
            }
        })
    }
    
    
    
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var authorOutlet: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
}
