//
//  Detail.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class Detail: UIViewController {

    @IBOutlet weak var backButton : UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
         view.backgroundColor = .white
    }
    override func viewWillAppear(_ animated: Bool) {
        navbarSetup()
    }
    func navbarSetup(){
        
        self.navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == false, animated: true);
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor  = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
         
        
    }
    @IBAction func close(_ sender: Any) {
        
    }
    @objc func goBack() {
        // Here we just remove the back button, you could also disabled it or better yet show an activityIndicator
        self.navigationItem.leftBarButtonItem = nil
        
    }
}
