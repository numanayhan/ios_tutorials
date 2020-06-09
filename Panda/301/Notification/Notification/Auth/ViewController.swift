//
//  ViewController.swift
//  Notification
//
//  Created by TRA on 16.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }


}

