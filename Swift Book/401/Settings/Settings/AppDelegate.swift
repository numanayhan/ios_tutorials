//
//  AppDelegate.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
 
import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var defaultRequest = DefaultRequest()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText =  "TAMAM"
        setAuth()
        UserDefaults.standard.set("CtBIwJONOGP8oA5Oj2gqEDOs897MbNrG",forKey: "userHash")
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = Menu()
        
        return true
    } 
    func setAuth(){
        
        if Network.isConnectedToNetwork() == true {
            let parameters  = [ "":""]
             defaultRequest.postParamsRequest( url:Config.isInit  , parameters: parameters , completion : { data in
                DispatchQueue.main.async {
                    let res = data as? NSDictionary
                        if res!["userHash"]  != nil {
                            guard let userHash = res!["userHash"] as? String else {return}
                            UserDefaults.standard.set(userHash, forKey: "userHash")
                            
                        }
                }
            })
        }
    }
}

