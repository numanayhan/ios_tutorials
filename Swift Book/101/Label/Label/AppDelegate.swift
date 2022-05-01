//
//  AppDelegate.swift
//  Label
//
//  Created by TRA on 26.11.2019.
//  Copyright © 2019 panda.io. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = ViewController()
        self.window!.makeKeyAndVisible() 
        return true
    }
    


}

