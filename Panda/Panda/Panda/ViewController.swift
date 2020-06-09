//
//  ViewController.swift
//  Panda
//
//  Created by TRA on 16.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    @IBAction func closed(_ sender: Any) {
             dismiss(animated: true, completion: nil)
       }

}
