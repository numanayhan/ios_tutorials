//
//  AppDelegate.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         
        UserDefaults.standard.set("CtBIwJONOGP8oA5Oj2gqEDOs897MbNrG",forKey: "userHash")
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: Settings())
        
        return true
    } 

}

