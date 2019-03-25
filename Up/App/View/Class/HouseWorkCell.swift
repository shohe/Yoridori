//
//  HouseWorkCell.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/23.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class HouseWorkCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    
    static var identifier:String {
        get{ return "HouseWorkCell" }
    }
    
    static var nib:UINib {
        get{ return UINib(nibName: "HouseWorkCell", bundle: nil) }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
