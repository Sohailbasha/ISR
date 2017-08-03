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
    
    let colors = [#colorLiteral(red: 1, green: 0.5803921569, blue: 0.5803921569, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.6823529412, blue: 1, alpha: 1), #colorLiteral(red: 0.4674596978, green: 0.9699000635, blue: 0.7230687893, alpha: 1), #colorLiteral(red: 1, green: 0.7764705882, blue: 0.5725490196, alpha: 1), #colorLiteral(red: 1, green: 0.8862745098, blue: 0.4, alpha: 1), #colorLiteral(red: 0.768627451, green: 0.5725490196, blue: 1, alpha: 1)]
    
    
    // MARK: - Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    

     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let destinationVC = segue.destination as? NewsListViewController {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                    let source = sources[indexPath.row]
                    destinationVC.title = source.name
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
        cell?.updateWith(source: source)
        return cell ?? UICollectionViewCell()
    }
    
    
}















