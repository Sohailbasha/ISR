//
//  MainViewController.swift
//  ISR
//
//  Created by Ilias Basha on 7/31/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SourceController.fetchSources { (sources) in

            self.sources = sources
            self.sources.remove(at: 5)
            self.sources.remove(at: 2)
            self.sources.remove(at: 1)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
    // MARK: - Properties
    
    var sources: [Source] = []
    
    
    
    // MARK: - Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    

     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let destinationVC = segue.destination as? NewsListViewController {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                    let source = sources[indexPath.row]
                    destinationVC.source = source

                }
            }
        }
     }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sourceCell", for: indexPath) as? SourceCollectionViewCell
        let source = sources[indexPath.row]
        
//        cell?.updateWith(source: source)
        return cell ?? UICollectionViewCell()
    }
    
    
    
}















