//
//  AppDelegate.swift
//  Notification
//
//  Created by TRA on 16.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var hasPresentedInvalidServiceInfoPlistAlert = false


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        FirebaseApp.configure()
           Messaging.messaging().delegate = self
           Messaging.messaging().shouldEstablishDirectChannel = true
           // Just for logging to the console when we establish/tear down our socket connection.
           listenForDirectChannelStateChanges();

           NotificationsController.configure()

           if #available(iOS 8.0, *) {
             // Always register for remote notifications. This will not show a prompt to the user, as by
             // default it will provision silent notifications. We can use UNUserNotificationCenter to
             // request authorization for user-facing notifications.
             application.registerForRemoteNotifications()
           } else {
             // iOS 7 didn't differentiate between user-facing and other notifications, so we should just
             // register for remote notifications
             NotificationsController.shared.registerForUserFacingNotificationsFor(application)
           }
        return true
    } 

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      print("APNS Token: \(deviceToken.hexByteString)")
      NotificationCenter.default.post(name: APNSTokenReceivedNotification, object: nil)
      if #available(iOS 8.0, *) {
      } else {
        // On iOS 7, receiving a device token also means our user notifications were granted, so fire
        // the notification to update our user notifications UI
        NotificationCenter.default.post(name: UserNotificationsChangedNotification, object: nil)
      }
    }

    func application(_ application: UIApplication,
                     didRegister notificationSettings: UIUserNotificationSettings) {
      NotificationCenter.default.post(name: UserNotificationsChangedNotification, object: nil)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      print("application:didReceiveRemoteNotification:fetchCompletionHandler: called, with notification:")
      print("\(userInfo.jsonString ?? "{}")")
      completionHandler(.newData)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      // If the app didn't start property due to an invalid GoogleService-Info.plist file, show an
      // alert to the developer.
       
    }

}


extension AppDelegate: MessagingDelegate {
  // FCM tokens are always provided here. It is called generally during app start, but may be called
  // more than once, if the token is invalidated or updated. This is the right spot to upload this
  // token to your application server, or to subscribe to any topics.
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    if let token = Messaging.messaging().fcmToken {
      print("FCM Token: \(token)")
    } else {
      print("FCM Token: nil")
    }
  }

  // Direct channel data messages are delivered here, on iOS 10.0+.
  // The `shouldEstablishDirectChannel` property should be be set to |true| before data messages can
  // arrive.
  func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
    // Convert to pretty-print JSON
    guard let prettyPrinted = remoteMessage.appData.jsonString else {
      print("Received direct channel message, but could not parse as JSON: \(remoteMessage.appData)")
      return
    }
    print("Received direct channel message:\n\(prettyPrinted)")
  }
}

extension AppDelegate {
    func listenForDirectChannelStateChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(onMessagingDirectChannelStateChanged(_:)), name: .MessagingConnectionStateChanged, object: nil)
    }

    @objc func onMessagingDirectChannelStateChanged(_ notification: Notification) {
        print("FCM Direct Channel Established: \(Messaging.messaging().isDirectChannelEstablished)")
    }
}

extension Dictionary {
  /// Utility method for printing Dictionaries as pretty-printed JSON.
  var jsonString: String? {
    if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]),
       let jsonString = String(data: jsonData, encoding: .utf8) {
      return jsonString
    }
    return nil
  }
}
