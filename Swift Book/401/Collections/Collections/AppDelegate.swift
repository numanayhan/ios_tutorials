//
//  AppDelegate.swift
//  Collections
//
//  Created by Numan Ayhan on 3.09.2021.
//

import UIKit

var appRoot : AppRoot?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
        appRoot = AppRoot(window: window!)
        appRoot?.collection()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .black
        
        return true
    }
 


}

