//
//  AppDelegate.swift
//  MultiLang
//
//  Created by Melike Büşra Ayhan on 6.03.2021.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        Localization.sharedInstance.setLanguage(languageCode: Locale.current.languageCode!)
         
 
        print("Localization",Localization.sharedInstance.getLanguage())
        return true
    }
}

