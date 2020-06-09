//
//  Launch.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class Launch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .white
        navbar()
    }
    
}
extension UIViewController  {
    func navbar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
    }
}
