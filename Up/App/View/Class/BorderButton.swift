//
//  BorderButton.swift
//  Up
//
//  Created by Shohe Ohtani on 2019/03/24.
//  Copyright © 2019 Shohe Ohtani. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var highlightedColor: UIColor = UIColor.clear {
        didSet {
//            self.setBackgroundColor(highlightedColor, for: .highlighted)
        }
    }
    
}
