//
//  ViewController.swift
//  Label
//
//  Created by TRA on 26.11.2019.
//  Copyright © 2019 panda.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Başlık dizesini etiketin sınırlayıcı dikdörtgenine sığdırmak için font boyutunun küçültülüp küçültülmeyeceğini belirten bir Boolean değeri."
        textLabel.textColor = UIColor.red
        textLabel.numberOfLines = 2
        textLabel.adjustsFontSizeToFitWidth = true
        
    }
 
}
 
