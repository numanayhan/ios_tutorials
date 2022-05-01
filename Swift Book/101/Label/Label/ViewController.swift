//
//  ViewController.swift
//  Label
//
//  Created by HR on 26.11.2019.
//  Copyright © 2019 HRDijital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Lazy
    lazy var headerTitle  : CustomLabel = {
       var label = CustomLabel()
       
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //textLabel içine kodlama ile de metin girilebilir
        headerTitle.text = "UILabel ile Metin içine kodlama ile de metin girilebilir. Bu metin Lazy ile içindeki obje boyutu kadar büyümesi sağlanır"
        headerTitle.frame = CGRect(x: 0, y: 0, width: 240.0, height:100)
        view.addSubview(headerTitle)
        headerTitle.center = view.center
        
    }
}
class CustomLabel: UILabel{
    
    required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            self.commonInit()
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.commonInit()
    }
    func commonInit(){
        self.text = ""
        self.textAlignment = .center
        self.textColor = .red
        self.lineBreakMode = .byWordWrapping
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.contentMode = .scaleAspectFill
        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
        func setProperties(borderWidth: Float, borderColor: UIColor) {
            self.layer.borderWidth = CGFloat(borderWidth)
            self.layer.borderColor = borderColor.cgColor
        }
}
