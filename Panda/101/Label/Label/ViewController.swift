//
//  ViewController.swift
//  Label
//
//  Created by TRA on 26.11.2019.
//  Copyright © 2019 panda.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Metin"
        textLabel.textColor = UIColor.black
        textLabel.numberOfLines = 2
//        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.font = UIFont.init(name: "Roboto", size: 10)
        textLabel.attributedText = NSAttributedString.init(string: "Değiştirilmesi daha kolay metin formatı olarak kullanılır.", attributes: .init())
        textLabel.frame  = CGRect(x: (view.frame.width -  textLabel.frame.width)/2, y: view.frame.midY, width: textLabel.frame.width , height: 20)
        
         
        
    }
    func addBottomBorder(_ uiView:UIView ,  borderWidth: CGFloat) ->UIView {
     
     uiView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    uiView.frame = CGRect(x: 0, y: view.frame.height - borderWidth, width: view.frame.width, height: borderWidth)
     
     return uiView
 }
}
 
