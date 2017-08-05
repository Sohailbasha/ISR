//
//  ArticleDetailTableViewCell.swift
//  ISR
//
//  Created by Ilias Basha on 8/4/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class ArticleDetailTableViewCell: UITableViewCell {
    
    
    func updateCellWith(story: Article) {
        DispatchQueue.main.async {
            self.storyTitle.text = story.title
            self.storyDesc.text = story.description
        }
        
        
        ImageController.image(forURL: story.imageEndPoint) { (storyImage) in
            if let image = storyImage {
                self.storyImage.image = image
            }
        }
    }
    
    @IBOutlet var storyImage: UIImageView!
    @IBOutlet var storyTitle: UILabel!
    @IBOutlet var storyDesc: UITextView!
    @IBOutlet var readOnWebsiteButton: UIButton!
    
    

}
