//
//  AddPost.swift
//  Settings
//
//  Created by nayhan on 20.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
 
import UIKit

class AddPost: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setTopBar()
        
    }
    func setTopBar(){
          
        let logoImage = UIImage(named: "logoLeft")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: -10, y: 0, width: 120, height: 44)
        logoImageView.contentMode = .scaleAspectFit
        let logoView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        logoView.clipsToBounds = false
        logoView.addSubview(logoImageView)
        let logoItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoItem
        
        
        let rightImage = UIImage(named: "store")
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.frame = CGRect(x: -10, y: 0, width: 120, height: 44)
        rightImageView.contentMode = .scaleAspectFit
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        rightView.clipsToBounds = false
        rightView.addSubview(rightImageView)
        let rightItem = UIBarButtonItem(customView: rightView)
        navigationItem.rightBarButtonItem = rightItem
         
    }

}
