//
//  ContainerViewController.swift
//  ISR
//
//  Created by Ilias Basha on 8/3/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var viewController: UISplitViewController!

    func setEmbedded(splitViewController: UISplitViewController!) {
        
        if splitViewController != nil {
            viewController = splitViewController
            
            
            self.addChildViewController(viewController)
            self.view.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)
            
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            
            let traitCollection = UITraitCollection(horizontalSizeClass: .regular)
            self.setOverrideTraitCollection(traitCollection, forChildViewController: viewController)
            
        } else {
            self.setOverrideTraitCollection(nil, forChildViewController: viewController)
        }
        
        super.viewWillTransition(to: size, with: coordinator)
    }

}
