//
//  SourceCollectionViewCell.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class SourceCollectionViewCell: UICollectionViewCell {
    

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
    func updateWith(source: Source) {
        DispatchQueue.main.async {
            self.sourceName.text = source.name
        }
    }
    
    @IBOutlet var sourceName: UILabel!
}
