//
//  About.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import SideMenuSwift

class About: UIViewController {

    let slideAnimator = SlideAnimation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    @IBAction func MenuClicked(_ sender: Any) {
           self.sideMenuController?.revealMenu()
    }
   
}
