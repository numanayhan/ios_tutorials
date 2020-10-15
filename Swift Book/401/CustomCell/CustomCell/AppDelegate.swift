//
//  AppDelegate.swift
//  CustomCell
//
//  Created by nayhan on 14.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navCtrl = UINavigationController(rootViewController: TVCTRL())
        navCtrl.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navCtrl
        window?.makeKeyAndVisible()
        return true
    }
}

