//
//  ViewController.swift
//  TextView
//
//  Created by TRA on 7.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func addBottomBorder(_ uiView:UIView ,  borderWidth: CGFloat) ->UIView {
        
        uiView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
       uiView.frame = CGRect(x: 0, y: view.frame.height - borderWidth, width: view.frame.width, height: borderWidth)
        
        return uiView
    }
}

