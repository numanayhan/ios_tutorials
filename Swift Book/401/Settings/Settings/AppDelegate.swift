//
//  AppDelegate.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
 
import UIKit
import IQKeyboardManagerSwift
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController =  Menu()
        attemptToRegisterForNotifications(application: application)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText =  "TAMAM"
        
        return true
    }
     
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
            print(token)

            print(deviceToken.description)
            if let uuid = UIDevice.current.identifierForVendor?.uuidString {
                print(uuid)
            }
            UserDefaults.standard.setValue(token, forKey: "ApplicationIdentifier")
            UserDefaults.standard.synchronize()

    }
    func attemptToRegisterForNotifications(application: UIApplication) {
        
        UNUserNotificationCenter.current().delegate = self
        
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (authorized, error) in
            if authorized {
                print("DEBUG: SUCCESSFULLY REGISTERED FOR NOTIFICATIONS")
            }else{
                print("NOT REGISTER")
                 
            }
        }
        application.registerForRemoteNotifications()
    }
     
   
}
extension AppDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
   
}

