//
//  AppRoot.swift
//  Collections
//
//  Created by Numan Ayhan on 3.09.2021.
//

import Foundation
import Foundation
import UIKit
public class DefaultNavigation: UINavigationController {
    var isDark = false {
        didSet {
            
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    var hide = true {
        didSet {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.backgroundColor  = UIColor.clear
            self.navigationBar.shadowImage = UIImage()
        }
    }
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDark ? .lightContent : .default
    }
}

class AppRoot {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func collection(){
        let root = DefaultNavigation(rootViewController: Collection())
        root.hide = true
        window!.rootViewController = root
        window!.makeKeyAndVisible()
    }
}
