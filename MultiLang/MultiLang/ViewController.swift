//
//  ViewController.swift
//  MultiLang
//
//  Created by Melike Büşra Ayhan on 6.03.2021.
//

import UIKit

class ViewController: UIViewController {

    private let mLabel : UILabel = {
       let label = UILabel()
        label.text =  Localization.sharedInstance.localizedStringForKey(key:"title",comment: "") //String.localize("title")
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let mLang : UIButton = {
       let button  = UIButton()
        button.setTitle("Dil Değiştir", for: .normal)
        button.addTarget(self, action: #selector(changeLang), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 5
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(mLabel)
        mLabel.frame = view.bounds
        
        view.addSubview(mLang)
        mLang.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: (view.frame.width / 2) - 50, paddingBottom: 20, paddingRight: 0, width: 100, height: 50)
        
        
    }
    @objc func changeLang(_ sender: UIButton){ 
        if Localization.sharedInstance.getLanguage() == "en"{
            Localization.sharedInstance.setLanguage(languageCode: "tr")
        }else{
            Localization.sharedInstance.setLanguage(languageCode: "en")
        }
        print("Localization",Localization.sharedInstance.getLanguage())
         viewDidLoad()
    }

}

