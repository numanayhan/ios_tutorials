//
//  ViewController.swift
//  Label
//
//  Created by HR on 26.11.2019.
//  Copyright © 2019 HRDijital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Sürükle bırak ile tanımladım ve Sayfaya bağladım.
    @IBOutlet weak var textLabel: UILabel!
    //Lazy ile kodlama ile tanıpladım
    lazy var metin  : UILabel = {
       var label = UILabel()
        label.text = " Created by HR on 1.11.2020. Copyright © 2019 hrdijital. All rights reserved."
        label.textAlignment = .center
        label.textColor = .red
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.isUserInteractionEnabled = true
        label.numberOfLines = 0
        label.backgroundColor = UIColor.init(red: 240, green: 240, blue: 240, alpha: 1.0)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textLabel içine kodlama ile de metin girilebilir
        textLabel.text = "UILabel ile Metin"
        metin.frame = CGRect(x: 0, y: 0, width: 240.0, height:100)
        view.addSubview(metin)
        metin.center = view.center
        
    }
    
}
 
