//
//  AppDelegate.swift
//  Localization
//
//  Created by TRA on 26.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if  UserDefaults.standard.object(forKey: "AppleLanguages")  == nil{
             
            UserDefaults.standard.set("tr",forKey: "AppleLanguages")
        }
        print("lang:",Locale.current.languageCode!)
        if UserDefaults.standard.string(forKey: "UIMode") == nil{
            UserDefaults.standard.set("light", forKey: "UIMode")
        }
         
        
        return true
    }


}

