//
//  Menu.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import SideMenuSwift
class Menu: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        sideMenuController?.cache(viewControllerGenerator: {
           self.storyboard?.instantiateViewController(withIdentifier: "Dashboard")
        }, with: "0")
        sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "Support")
        }, with: "1")
        
    }
    func setTableView(){
             
        tableView?.register(MenuCell.nib, forCellReuseIdentifier: MenuCell.identifier)
        tableView?.allowsMultipleSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

}

extension Menu : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
                let row = indexPath.row
                cell.selectedView.isHidden = true
                if row == 0{
                    cell.titleMenu?.text = "Piyasa Gözlemi"
                } else if row == 1 {
                    cell.titleMenu?.text = "Ayarlar"
                     
                }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.init(named: "menu")
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        print(row,"row")
        sideMenuController?.isMenuRevealed = true
        sideMenuController?.setContentViewController(with: "\(row)")
        sideMenuController?.hideMenu()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
}


extension Menu : SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransactionForMenu(options: .transitionFlipFromLeft, duration: 0.6)
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
//        print("[Example] View controller will show [\(viewController)]")
         
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
//        print("[Example] View controller did show [\(viewController)]")
    }
    
    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
//
         
    }
    
    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
//        print("[Example] Menu did hide.")
         
    }
    
    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
//        print("[Example] Menu will reveal.")
        
    }
    
    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
//        print("[Example] Menu did reveal.")
         
    }
    
}
