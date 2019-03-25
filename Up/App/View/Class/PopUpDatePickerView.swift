//
//  PopUpDatePickerView.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/24.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

import UIKit

protocol PopupDatePickerViewDelegate {
    func popupDatePicker(_pickerView: PopupDatePickerView, didCanceled sender: UIDatePicker)
    func popupDatePicker(_pickerView: PopupDatePickerView, didSelected sender: UIDatePicker)
}

class PopupDatePickerView: UIView {

    @IBOutlet weak var continerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var delegate: PopupDatePickerViewDelegate?
    
    private let show: CGFloat = 32
    private let hide: CGFloat = -480
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        let contentView = Bundle.main.loadNibNamed("PopupDatePickerView", owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        self.alpha = 0
        addSubview(contentView)
    }
    
    @IBAction func tapCancel(_ sender: Any) {
        delegate?.popupDatePicker(_pickerView: self, didCanceled: datePicker)
    }
    
    @IBAction func tapSelect(_ sender: Any) {
        delegate?.popupDatePicker(_pickerView: self, didSelected: datePicker)
    }
}


extension PopupDatePickerView {
    
    func initPopupDatePicker() {
        UIView.animate(withDuration: 0.3) {
            self.bottomConstraint.constant = self.show
            self.alpha = 1
            self.layoutIfNeeded()
        }
    }
    
    func hidePopupDatePicker() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomConstraint.constant = self.hide
            self.alpha = 0
            self.layoutIfNeeded()
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
        
    }
    
}
