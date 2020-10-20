//
//  Menu.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class Menu: UITabBarController ,UITabBarControllerDelegate{
    let dot = UIView()
    var isInitialLoad: Bool?
    let headerColor = UIColor.init(named: "headerBar")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
         
        setTabBar()
    }
    func setNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = ""
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
        navigationController?.navigationBar.barTintColor = headerColor
        
    }
    func setTabBar() {
        navigationController?.navigationBar.isHidden  = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        let store = setNav(unselected: #imageLiteral(resourceName: "right"), selected: #imageLiteral(resourceName: "right"), root: Store(collectionViewLayout: UICollectionViewFlowLayout()))
        let search = setNav(unselected: #imageLiteral(resourceName: "right"), selected: #imageLiteral(resourceName: "right"), root: Search())
        let addPost = setNav(unselected: #imageLiteral(resourceName: "right"), selected: #imageLiteral(resourceName: "right"),root: AddPost())
        let services = setNav(unselected: #imageLiteral(resourceName: "right"), selected: #imageLiteral(resourceName: "right"),root: Services())
        let profile = setNav(unselected: #imageLiteral(resourceName: "right"), selected: #imageLiteral(resourceName: "right"),root:Settings())
        
        viewControllers = [store,search,addPost,services,profile]
        tabBar.tintColor = .black
    }
    func setNav(unselected: UIImage, selected: UIImage, root: UIViewController = UIViewController()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: root)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        navController.navigationBar.tintColor = .black
        return navController
    }
}
