//
//  HomeViewController.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/23.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class HomeViewController: RootViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableViewCells()
    }
    
}

// MARK: - Private
extension HomeViewController {
    
    private func initTableViewCells() {
        // row height automatic
        tableView.contentInset = UIEdgeInsets.init(top: 12, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        
        // register cells
        tableView.register(HouseWorkCell.nib, forCellReuseIdentifier: HouseWorkCell.identifier)
    }
    
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}


// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HouseWorkCell.identifier, for: indexPath) as? HouseWorkCell {
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
