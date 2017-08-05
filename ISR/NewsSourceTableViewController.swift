//
//  NewsSourceTableViewController.swift
//  ISR
//
//  Created by Ilias Basha on 8/3/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class NewsSourceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SourceController.fetchSources { (sources) in
            
            self.sources = sources
            self.sources.remove(at: 5)
            self.sources.remove(at: 2)
            self.sources.remove(at: 1)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.tableFooterView = UIView()
    }

    var sources: [Source] = []
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCell", for: indexPath)

        let source = sources[indexPath.row]
        cell.textLabel?.text = source.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = sources[indexPath.row]
        if let newsListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idNewsListViewController") as? NewsListViewController {
            newsListViewController.source = source
            showDetailViewController(newsListViewController, sender: self)
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select news source to begin reading stories"
    }
    

}
