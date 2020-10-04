
//
//  Menu.swift
//  SideMenu
//
//  Created by TRA on 4.04.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import SideMenu
import SideMenuSwift
class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}
class Menu: UIViewController {
    var isDarkModeEnabled = false
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var profileInfo: UILabel!

    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    private var themeColor = UIColor.white

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    
     isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
            configureView()

            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "Dashboard")
            }, with: "1")

            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "Profile")
            }, with: "2")

            sideMenuController?.delegate = self
        }

        private func configureView() {
            if isDarkModeEnabled {
                themeColor = UIColor(red: 0.03, green: 0.04, blue: 0.07, alpha: 1.00)
                profileInfo.textColor = .white
            } else {
                selectionMenuTrailingConstraint.constant = 0
                themeColor = UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
            }

            let sidemenuBasicConfiguration = SideMenuController.preferences.basic
            let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
            if showPlaceTableOnLeft {
                selectionMenuTrailingConstraint.constant = SideMenuController.preferences.basic.menuWidth - view.frame.width
            }

            view.backgroundColor = themeColor
            tableView.backgroundColor = themeColor
        }

        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)

            let sidemenuBasicConfiguration = SideMenuController.preferences.basic
            let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
            selectionMenuTrailingConstraint.constant = showPlaceTableOnLeft ? SideMenuController.preferences.basic.menuWidth - size.width : 0
            view.layoutIfNeeded()
        }
}
extension Menu: SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }

    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller will show [\(viewController)]")
    }

    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller did show [\(viewController)]")
    }

    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will hide")
    }

    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did hide.")
    }

    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will reveal.")
    }

    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did reveal.")
    }
}

extension Menu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    // swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        cell.contentView.backgroundColor = themeColor
        let row = indexPath.row
        if row == 0 {
            cell.titleLabel?.text = "Dashboard"
        } else if row == 1 {
            cell.titleLabel?.text = "Profile"
        } else if row == 2 {
            cell.titleLabel?.text = "Contact"
        }
        cell.titleLabel?.textColor = isDarkModeEnabled ? .white : .black
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row

        sideMenuController?.setContentViewController(with: "\(row)", animated: Preferences.shared.enableTransitionAnimation)
        sideMenuController?.hideMenu()

        if let identifier = sideMenuController?.currentCacheIdentifier() {
            print("[Example] View Controller Cache Identifier: \(identifier)")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
