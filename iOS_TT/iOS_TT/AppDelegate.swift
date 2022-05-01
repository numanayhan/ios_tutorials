//
//  AppDelegate.swift
//  iOS_TT
//
//  Created by Numan Ayhan on 14.10.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setApp()
        return true
    }
    func setApp(){
        window = UIWindow(windowScene: UIScreen.main.bounds)
        window?.rootViewController = NavigationRoot()
    }



}

