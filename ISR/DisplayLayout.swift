//
//  DisplayLayout.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

protocol LayoutDelegate: class {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath, with width: CGFloat) -> CGFloat
    
    func collectionView(collectionView: UICollectionView, heightForText indexPath: IndexPath, with width: CGFloat) -> CGFloat
}


class DisplayLayout: UICollectionViewLayout {

    
    
    var delegate: LayoutDelegate?
    
    
    var numberOfColumns: CGFloat = 2
    var cellPadding: CGFloat = 5.0
    private var contentHeight: CGFloat = 0.0
    private var contentWidth: CGFloat {
        guard let insets = collectionView?.contentInset, let width = collectionView?.bounds.width else { return 0.0 }
        return (width - (insets.left + insets.right))
    }
    
    private var attributeCache = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        if attributeCache.isEmpty {
            let columnWidth = contentWidth / numberOfColumns
            var xOffsets = [CGFloat]()
            for collumn in 0..<Int(numberOfColumns) {
                xOffsets.append(CGFloat(collumn) * columnWidth)
            }
            
            var column = 0
            var yOffsets = [CGFloat](repeatElement(0, count: Int(numberOfColumns)))
            
            guard let items = collectionView?.numberOfItems(inSection: 0) else { return }
            for item in 0 ..< items {
                let indexPath = IndexPath(item: item, section: 0)
                
                let width = columnWidth - cellPadding * 2

                let photoHeight: CGFloat = (delegate?.collectionView(collectionView: collectionView!, heightForItemAtIndexPath: indexPath, with: width))!
                let captionHeight: CGFloat = (delegate?.collectionView(collectionView: collectionView!, heightForText: indexPath, with: width))!
                
                let height = cellPadding + photoHeight + captionHeight + cellPadding
                
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
                
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                
                attributeCache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffsets[column] = yOffsets[column] + height
                
                if column >= (Int(numberOfColumns) - 1) {
                    column = 0
                } else {
                    column += 1
                }
            }
            
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in attributeCache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
    
    
}




































