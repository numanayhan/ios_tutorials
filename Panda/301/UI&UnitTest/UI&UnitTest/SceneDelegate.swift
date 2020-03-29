//
//  SceneDelegate.swift
//  UI&UnitTest
//
//  Created by TRA on 19.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
@available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
         
    }
@available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
@available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
    }
@available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) { 
    }
@available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

