//
//  SourceCollectionViewCell.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class SourceCollectionViewCell: UICollectionViewCell {
    

    func updateWith(source: Source) {
        DispatchQueue.main.async {
            self.sourceName.text = source.name
        }
    }
    
    @IBOutlet var sourceName: UILabel!
}
