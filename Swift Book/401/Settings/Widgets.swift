//
//  Widgets.swift
//  Settings
//
//  Created by Melike Büşra Ayhan on 7.11.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    let checked = UIImage(named: "checked")! as UIImage
    let unChecked = UIImage(named: "check")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checked, for: UIControl.State.normal)
            } else {
                self.setImage(unChecked, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked =  false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
