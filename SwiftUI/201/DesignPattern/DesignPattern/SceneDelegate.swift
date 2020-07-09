//
//  SceneDelegate.swift
//  DesignPattern
//
//  Created by TRA on 13.04.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         
         
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = usersVC()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    func usersVC() -> UIViewController{
        let sot =  UsersSourceOfTruth()
        let usersCV = UsersCV(sot:sot)
        let userVC = UsersVC(rootView: usersCV)
        
        return userVC
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

