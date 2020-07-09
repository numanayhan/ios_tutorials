//
//  ViewController.swift
//  UI&UnitTest
//
//  Created by TRA on 19.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import UIKit
//struct System {
//    static func clearNavigationBar(forBar navBar: UINavigationBar) {
//        navBar.setBackgroundImage(UIImage(), for: .default)
//        navBar.shadowImage = UIImage()
//        navBar.isTranslucent = true
//    }
//}
class ViewController: UIViewController {
    @IBOutlet weak var headerImageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      if let navController = navigationController {
//          System.clearNavigationBar(forBar: navController.navigationBar)
//          navController.view.backgroundColor = .clear
//      }
        if UIDevice().userInterfaceIdiom == .phone {
          headerImageHeightConstraint.constant = getHeaderImageHeightForCurrentDevice()
        }
    }
    func getHeaderImageHeightForCurrentDevice() -> CGFloat {
      switch UIScreen.main.nativeBounds.height {
      case 2436: // iPhone X
        return 175
      default: // Every other iPhone
        return 145
      }
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
      switch UIDevice.current.orientation {
      case .landscapeLeft, .landscapeRight:
        headerImageHeightConstraint.constant = 55
      default:
        headerImageHeightConstraint.constant = getHeaderImageHeightForCurrentDevice()
      }
    }

}

