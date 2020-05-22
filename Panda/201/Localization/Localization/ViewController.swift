//
//  ViewController.swift
//  Localization
//
//  Created by TRA on 26.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lang: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       lblHeader.text =  LocalizationSystem.sharedInstance.localizedStringForKey(key: "DZc-o9-xcv", comment: "")
        if #available(iOS 13.0, *) {
            if UserDefaults.standard.string(forKey: "UIMode") != nil{
                let isMode =  UserDefaults.standard.string(forKey: "UIMode")
                if (isMode ==  "light"){
                    view.overrideUserInterfaceStyle =  .light
                }else{
                    view.overrideUserInterfaceStyle =  .dark
                }
            }
            
        } else {
            // Fallback on earlier versions
        }
      
       
    }
    @IBAction func isMode(_ sender: UIButton) {
        if UserDefaults.standard.string(forKey: "UIMode") != nil{
            let isMode = UserDefaults.standard.string(forKey: "UIMode")
            switch isMode {
             case "dark":
                if #available(iOS 13.0, *) {
                    view.overrideUserInterfaceStyle = .light
                } else {
                    // Fallback on earlier versions
                }
                UserDefaults.standard.set("light", forKey: "UIMode")
            case "light":
                if #available(iOS 13.0, *) {
                    view.overrideUserInterfaceStyle = .dark
                } else {
                    // Fallback on earlier versions
                }
                UserDefaults.standard.set("dark", forKey: "UIMode")
            default:
                break
            }
        }
    }
    @IBAction func langChange(_ sender: UIButton){
              if LocalizationSystem.sharedInstance.getLanguage() == "tr" {
                  LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
                  UIView.appearance().semanticContentAttribute = .forceLeftToRight
                 self.lang.setTitle("EN", for: .normal)
              } else {
                  LocalizationSystem.sharedInstance.setLanguage(languageCode: "tr")
                  UIView.appearance().semanticContentAttribute = .forceRightToLeft
                  self.lang.setTitle("TR", for: .normal)
              }
        viewDidLoad()
              
    }
    @IBAction func uiMode(_ sender: UISwitch) {
        if sender.isOn {
            if #available(iOS 13.0, *) {
                view.overrideUserInterfaceStyle = .light
            } else {
                // Fallback on earlier versions
            }
        }else {
            if #available(iOS 13.0, *) {
                view.overrideUserInterfaceStyle = .dark
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    
}
