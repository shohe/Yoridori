//
//  RootTabViewController.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/23.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

protocol RootTabViewControllerDelegate {
    func rootTableViewController(didClickCenterButton sender: UIButton)
}

class RootTabViewController: UITabBarController {
    
    var _delegate: RootTabViewControllerDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTabDesign()
        self.addCenterBigButton()
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        self._delegate?.rootTableViewController(didClickCenterButton: sender)
    }
    
}


extension RootTabViewController {
    
    private func addCenterBigButton() {
        let buttonSize: CGFloat = 60
        let position = UIScreen.main.bounds.width/2 - buttonSize/2
        let button = UIButton(frame: CGRect(x: position, y: -buttonSize/5, width: buttonSize, height: buttonSize))
        
        button.backgroundColor = .white
        button.layer.masksToBounds = false
        button.layer.cornerRadius = buttonSize/2
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(hex: "7DCEC8").cgColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
        self.tabBar.addSubview(button)
    }
    
    private func initTabDesign() {
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor(hex: "FFFFFF", alpha: 0.5)
        tabBar.barTintColor = UIColor(hex: "7DCEC8")
    }
    
}
