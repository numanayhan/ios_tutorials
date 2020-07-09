//
//  Main.swift
//  Notification
//
//  Created by TRA on 16.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goMain), userInfo: nil, repeats: false)
    }
    @objc func goMain(){
        self.performSegue(withIdentifier: "goAuth", sender: nil)
    }
    
 
}
