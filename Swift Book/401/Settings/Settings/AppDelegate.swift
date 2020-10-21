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
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = Menu()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText =  "TAMAM"
        setAuth()
        
        return true
    } 
    func setAuth(){
        
        if Network.isConnectedToNetwork() == true {
            let parameters  = [ "route":"common/home/init"]
             defaultRequest.postParamsRequest( url:Config.isInit  , parameters: parameters , completion : { data in
                DispatchQueue.main.async {
                    let res = data as? NSDictionary
                        if res!["userHash"]  != nil { 
                            guard let userHash = res!["userHash"] as? String else {return}
                            UserDefaults.standard.set(userHash, forKey: "userHash")
                             
                        }
                }
            })
        }else{
            self.window = UIWindow()
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = NotNetwork()
        }
    }
}

