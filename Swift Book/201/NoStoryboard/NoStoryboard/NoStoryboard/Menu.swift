//
//  Menu.swift
//  NoStoryboard
//
//  Created by nayhan on 17.07.2020.
//  Copyright © 2020 hrdijital. All rights reserved.
//

import UIKit
 
class Menu: UIViewController {

    lazy var login  : UIButton = {
       
        let btn =  UIButton()
        btn.setTitle("Giriş Yap", for: .normal)
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 0.2
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(.yellow, for: .normal)
        
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
          
         
         view.addSubview(login)
         login.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 250, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:50)
        
    }
    override func viewDidAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor  = UIColor.clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.topItem?.title = ""
    }
}
