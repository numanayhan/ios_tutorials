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
        
        
    }
    func addBottomBorder(_ uiView:UIView ,  borderWidth: CGFloat) ->UIView {
     
     uiView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    uiView.frame = CGRect(x: 0, y: view.frame.height - borderWidth, width: view.frame.width, height: borderWidth)
     
     return uiView
 }
}
 
