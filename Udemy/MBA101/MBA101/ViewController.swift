//
//  ViewController.swift
//  MBA101
//
//  Created by Melike Büşra Ayhan on 9.11.2020.
//

import UIKit

class ViewController: UIViewController {

//    email değişken adıyla editext oluşturduk.
    @IBOutlet weak var email: UITextField!
//    login değişken adıyla buton oluşturduk ve köşelerine 5 birimlik radius verdik.
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 5
    }

//  butona aksiyon tanımladık.
    @IBAction func enterLogin(_ sender: Any) {
//       email parametresinin boş olduğu koşulunu kontrol ettik.
        if (email.text!.isEmpty) {
            print("mail girin")

        }else{
//            email boş değilse konsola yazdırdık.
            print("m",email.text!)
        
        }
    }
    
}

