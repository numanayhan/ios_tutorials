//
//  Menu.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
import Alamofire
import Network

class Menu: UITabBarController ,UITabBarControllerDelegate{
    let dot = UIView()
    var isInitialLoad: Bool?
    let headerColor = UIColor.init(named: "headerBar")
    var defaultRequest = DefaultRequest()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
         
        if (UserDefaults.standard.string(forKey: "ApplicationIdentifier") != nil){
            print(UserDefaults.standard.string(forKey: "ApplicationIdentifier"))
        }else{
            print("ApplicationIdentifier else ")
        }
         
        setNavBar()
        
        setTabBar()
        
        setAuth()
    }
    func setNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .none
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = ""
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
         
        
    }
    func setTabBar() {
        let unStoreIcon = resizeImage(image: UIImage.init(named: "un_store")!)
        let StoreIcon = resizeImage(image: UIImage.init(named: "un_store")!)
        let store = setNav(unselected: unStoreIcon, selected: StoreIcon,title:"Vitrin", root:  Store(collectionViewLayout: UICollectionViewFlowLayout()))
        let unSearchIcon = resizeImage(image: UIImage.init(named: "un_search")!)
        let SearchIcon = resizeImage(image: UIImage.init(named: "search")!)
        let search = setNav(unselected: unSearchIcon, selected: SearchIcon,title:"Arama", root: Search())
        let unPostIcon = resizeImage(image: UIImage.init(named: "un_post")!)
        let PostIcon = resizeImage(image: UIImage.init(named: "post")!)
        let addPost = setNav(unselected: unPostIcon, selected: PostIcon,title:"İlan Ver",root: AddPost())
        let unServiceIcon = resizeImage(image: UIImage.init(named: "un_service")!)
        let ServiceIcon = resizeImage(image: UIImage.init(named: "service")!)
        let services = setNav(unselected: unServiceIcon, selected: ServiceIcon,title:"Servisler",root: Services())
        let unUserIcon = resizeImage(image: UIImage.init(named: "un_user")!)
        let UserIcon = resizeImage(image: UIImage.init(named: "user")!)
        let user = setNav(unselected: unUserIcon, selected: UserIcon,title:"Bana Özel",root:Settings())
        
        
        viewControllers = [search,store,addPost,services,user]
        tabBar.tintColor = .black
        
        print("test")
    }
    func resizeImage(image: UIImage ) -> UIImage {
        let widthRatio  =  20.0
        let heightRatio = 20.0
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: 20 , height: 20 )
        } else {
            newSize = CGSize(width: 20,  height: 20 )
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
      return newImage!
    }
    func setNav(unselected: UIImage, selected: UIImage, title:String,root: UIViewController = UIViewController()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: root)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        navController.navigationBar.tintColor = .white
        navController.navigationBar.barTintColor = UIColor.init(named: "navbar")
         
      return navController
    }
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        let tabImage = UIImage(named: "tab")
        let tabImageView = UIImageView(image: tabImage)
        tabImageView.frame = CGRect(x:  0, y: 0, width: tabBar.frame.width, height: tabBar.frame.height)
        tabImageView.contentMode = .scaleAspectFit
         
        tabBar.backgroundImage =  tabImageView.image
        
    }
    func setAuth(){
        if Network.isConnectedToNetwork()  {
            let parameters  = [ "route":"common/home/init"]
             defaultRequest.postParamsRequest( url:Config.isInit  , parameters: parameters , completion : { data in
                DispatchQueue.main.async {
                    let res = data as? NSDictionary
                        if res!["userHash"]  != nil {
                            guard let userHash = res!["userHash"] as? String else {return}
                            print("userHash",userHash)
                            UserDefaults.standard.set(userHash, forKey: "userHash")
                            
                        }
                }
            })
        }else{
            print("isNotConnectedToNetwork")
        }
    }
}
