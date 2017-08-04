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
        
        storyBackgroundView.layer.cornerRadius = 10
        
    }
    
    
    
    
    func updateWith(article: Article) {
        
        DispatchQueue.main.async {
            self.title.text = article.title
            self.descriptionTextField.text = article.description
        }
        
        
        ImageController.image(forURL: article.imageEndPoint, completion: { (articleImage) in
            if let image = articleImage {
                self.imageView.image = image
            }
        })
    }
    
    
    @IBOutlet var title: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var storyBackgroundView: UIView!
    @IBOutlet var descriptionTextField: UITextView!

    
}
