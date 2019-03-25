//
//  ViewController.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/23.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, RootTabViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.tabBarController as? RootTabViewController)?._delegate = self
    }

    func rootTableViewController(didClickCenterButton sender: UIButton) {
        let viewController = CreateViewController.instantiateViewController()
        self.present(viewController, animated: true, completion: nil)
    }
    
}

