//
//  Dashboard.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import SideMenuSwift
class Dashboard: UIViewController {

    var backButton : UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden  = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == true, animated: true);
    }
      
    @IBAction func MenuClicked(_ sender: Any) {
           self.sideMenuController?.revealMenu()
    } 
}
