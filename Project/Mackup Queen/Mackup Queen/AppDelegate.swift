//
//  AppDelegate.swift
//  Mackup Queen
//
//  Created by TRA on 22.01.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        FirebaseApp.configure()
        Messaging.messaging().isAutoInitEnabled = true
        Messaging.messaging().isProxy()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshToken), name: .MessagingRegistrationTokenRefreshed, object: nil)
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
                   options: authOptions,
                   completionHandler: {_, _ in })
        UNUserNotificationCenter.current().delegate = self
        attemptToRegisterForNotifications(application: application)
        
        window = UIWindow()
        window?.rootViewController = Login()
        return true
    }
  func localization(key:String) -> String{
          
    let text = Localization.sharedInstance.localizedStringForKey(key:key, comment: "")
          return text
      }
     public func setAPNSToken(_ deviceToken: Data) {
         Messaging.messaging().apnsToken = deviceToken
         refreshToken()
     }
     @objc
        public func refreshToken() {
        InstanceID.instanceID().instanceID(handler: {(result, error) in
                if let refreshedToken = result?.token {
 //                                   UNNotificationRequest.regFIRTokenAndDeviceID(refreshedToken)
                    print(refreshedToken)
                }
            })
        }
     func attemptToRegisterForNotifications(application: UIApplication) {
         
         Messaging.messaging().delegate = self
         
         UNUserNotificationCenter.current().delegate = self
         
         let options: UNAuthorizationOptions = [.alert, .badge, .sound]
         UNUserNotificationCenter.current().requestAuthorization(options: options) { (authorized, error) in
             if authorized {
                 print("DEBUG: SUCCESSFULLY REGISTERED FOR NOTIFICATIONS")
             }
         }
         application.registerForRemoteNotifications()
     }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                          fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
             
             completionHandler(UIBackgroundFetchResult.newData)
         }
    func applicationDidBecomeActive(_ application: UIApplication) {
             //Reset Bagde while entering App
             if (UIApplication.shared.applicationIconBadgeNumber != 0) {
                 UIApplication.shared.applicationIconBadgeNumber = 0
             }
         }
         
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
             print("APNs token retrieved: \(deviceToken)")
             Messaging.messaging().apnsToken = deviceToken
             
         }
         
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
             print("Unable to register for remote notifications: \(error.localizedDescription)")
         }
         func applicationWillResignActive(_ application: UIApplication) {
             
         }
     func setNotification(Message:String){
         
         
     }
     func receivedURL(_ url: URL, contains parameter: String) -> String? {
         let urlString = url.absoluteString
         
         //add = to parameter
         let parameterNameWithEqual = "\(parameter)="
         
         guard let rangeOfParameterName = urlString.range(of: parameterNameWithEqual) else {
             return nil
         }
         
         //create a substring starting after the parameter name
         let parametersAfterParameterName = String(urlString[rangeOfParameterName.upperBound...])
         
         //check if we have more parameters after the one we're looking for
         guard let rangeOfNextAmpersand = parametersAfterParameterName.index(of: "&") else {
             //we did not, just return the value then
             return parametersAfterParameterName
         }
         
         //cut the substring where the next parameter starts
         return String(parametersAfterParameterName.prefix(upTo: rangeOfNextAmpersand))
     }
      
     func applicationDidEnterBackground(_ application: UIApplication) {
         // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
         // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     }

     func applicationWillEnterForeground(_ application: UIApplication) {
         // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
     }
  

     func applicationWillTerminate(_ application: UIApplication) {
         // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
     }


 }
 extension AppDelegate: UNUserNotificationCenterDelegate {
     
     func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
         
         let userInfo = notification.request.content.userInfo
         print("userInfo \(userInfo)")
         completionHandler([.alert, .badge, .sound])
     }
     
     func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
         
         let userInfo = response.notification.request.content.userInfo
         
         print("userInfo \(userInfo)")
         completionHandler()
         
     }
     
 }

 extension AppDelegate: MessagingDelegate {
     
     func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
         print("fcmToken \(fcmToken)")
         let dataDict:[String: String] = ["token": fcmToken]
         NotificationCenter.default.post(name: NSNotification.Name("FCMToken"), object: nil, userInfo: dataDict)
         UserDefaults.standard.set(fcmToken, forKey: "fcmToken")
     }
     func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
         print("Received data message: \(remoteMessage.appData)")
         
     }
     
 }

 extension Data {
     public var hexString: String {
         var string = ""
         enumerateBytes { (buffer, _, _) in
             buffer.forEach({ (byte) in
                 string = string.appendingFormat("%02x", byte)
             })
         }
         return string
     }
 }
