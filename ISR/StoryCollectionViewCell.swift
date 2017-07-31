//
//  StoryCollectionViewCell.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    
    func updateWith(article: Article) {
        DispatchQueue.main.async {
            self.titleOutlet.text = article.title
            self.authorOutlet.text = article.author
            self.textView.text = article.description
        }

    }
    
    
    
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var authorOutlet: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
}
