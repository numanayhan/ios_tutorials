//
//  Dashboard.swift
//  SideMenu
//
//  Created by Numan Ayhan on 27.08.2021.
//  Copyright © 2021 panda. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMenuTapped(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }

}
