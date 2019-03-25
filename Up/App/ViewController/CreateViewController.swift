//
//  CreateViewController.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/23.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class CreateViewController: RootViewController {
    
    static func instantiateViewController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Create", bundle: nil)
        let navController = storyboard.instantiateInitialViewController() as! UINavigationController
        return navController
    }
    
    private var pickerView: PopupDatePickerView!
    private var houseWorkButton: UIButton?
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var cleaningButton: BorderButton!
    @IBOutlet weak var landlyButton: BorderButton!
    @IBOutlet weak var cookButton: BorderButton!
    @IBOutlet weak var childCareButton: BorderButton!
    @IBOutlet weak var shoppingButton: BorderButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toSelectHouseWorkViewController":
            let vc = segue.destination as? SelectHouseWorkViewController
            vc?.typeButton = sender as? UIButton
            return
        default: return
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setDate(_ sender: Any) {
        self.addPickerView()
        pickerView.initPopupDatePicker()
    }
}


extension CreateViewController {
    
    private func addPickerView() {
        pickerView = PopupDatePickerView(frame: self.view.bounds)
        pickerView.delegate = self
        self.view.addSubview(pickerView)
    }
    
    private func removePickerView() {
        pickerView.hidePopupDatePicker()
    }
    
    private func initButtons() {
        cleaningButton.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        landlyButton.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        cookButton.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        childCareButton.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
        shoppingButton.addTarget(self, action: #selector(transitionSelectHouseViewController(_:)), for: .touchUpInside)
    }
    
    @objc func transitionSelectHouseViewController(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toSelectHouseWorkViewController", sender: sender)
    }
    
}

// MARK: - PopupDatePickerViewDelegate
extension CreateViewController: PopupDatePickerViewDelegate {
    func popupDatePicker(_pickerView: PopupDatePickerView, didCanceled sender: UIDatePicker) {
        removePickerView()
    }
    
    func popupDatePicker(_pickerView: PopupDatePickerView, didSelected sender: UIDatePicker) {
        removePickerView()
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM月dd日"
        timeFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.string(from: sender.date)
        let time = timeFormatter.string(from: sender.date)
        
        dateButton.setTitle("\(date)\(time)", for: .normal)
    }
}
