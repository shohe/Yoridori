//
//  SelectHouseWorkViewController.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/24.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class SelectHouseWorkViewController: UIViewController {
    
//    static func instantiateViewController(typeButton: UIButton) -> SelectHouseWorkViewController {
//        let storyboard = UIStoryboard(name: "Create", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "SelectHouseWorkViewController") as! SelectHouseWorkViewController
//        viewController.typeButton = typeButton
//        return viewController
//    }
    
    var typeButton: UIButton?
    
    @IBOutlet weak var houseWorkTypeButton: BorderButton!
    @IBOutlet weak var work01: BorderButton!
    @IBOutlet weak var work02: BorderButton!
    @IBOutlet weak var work03: BorderButton!
    @IBOutlet weak var work04: BorderButton!
    @IBOutlet weak var work05: BorderButton!
    @IBOutlet weak var work06: BorderButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initButtons()
        let bgImg = typeButton?.image(for: .normal)
        houseWorkTypeButton.setBackgroundImage(bgImg, for: .normal)
        self.addTransition()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toSelectFeelingViewController": return
        default: return
        }
    }

}

extension SelectHouseWorkViewController {
    
    private func initButtons() {
        addShadow(button: work01)
        addShadow(button: work02)
        addShadow(button: work03)
        addShadow(button: work04)
        addShadow(button: work05)
        addShadow(button: work06)
    }
    
    private func addShadow(button: UIButton) {
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor(hex: "ED7470").cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize.init(width: 0, height: 2)
    }
    
    private func addTransition() {
        work01.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        work02.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        work03.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        work04.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        work05.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        work06.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
    }
    
    @objc func transitionSelectHouseViewController(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toSelectFeelingViewController", sender: sender)
    }
    
}
