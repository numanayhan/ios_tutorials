//
//  MainTab.swift
//  Mackup Queen
//
//  Created by TRA on 11.05.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import UIKit
import Firebase

class MainTab: UITabBarController,UITabBarControllerDelegate {

    let dot = UIView()
       var isInitialLoad: Bool?
       
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
    }
  
    

}
