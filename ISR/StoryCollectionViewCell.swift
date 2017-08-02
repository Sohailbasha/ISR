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
        
        /*
        self.contentView.layer.masksToBounds = true
        let color = #colorLiteral(red: 0.6817893401, green: 0.6817893401, blue: 0.6817893401, alpha: 0.3031892123)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        */
    }
    
    
    
    
    func updateWith(article: Article) {
        
        DispatchQueue.main.async {
            self.titleOutlet.text = article.title

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
