//
//  ViewController.swift
//  Init
//
//  Created by TRA on 20.03.2020.
//  Copyright © 2020 panda. All rights reserved.

import UIKit

class ViewController: UIViewController {

    // 1. Variables
    var number = 1
    var text = "text"
    var currency = 1_000
    var multiLine = "First,Second"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d  = 123.444.precision(2,roundingMode: .ceiling)
        print(d)
        
        
    }


}

