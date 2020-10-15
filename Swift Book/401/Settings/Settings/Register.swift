//
//  Register.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class Register: UIViewController {
    let firstName: UITextField = {
           let tf = UITextField()
           tf.placeholder = "First Name"
           tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
           tf.borderStyle = .roundedRect
           tf.font = UIFont.systemFont(ofSize: 14)
           tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
           return tf
       }()
       
       let lastName: UITextField = {
           let tf = UITextField()
           tf.placeholder = "Last Name"
           tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
           tf.borderStyle = .roundedRect
           tf.font = UIFont.systemFont(ofSize: 14)
           tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
           return tf
       }()
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setComponents()
        
    }
    func setComponents() {
         let viewRegister = UIStackView()
        viewRegister.axis = .vertical
        viewRegister.spacing = 10
        viewRegister.distribution = .fillEqually
         view.addSubview(viewRegister)
         viewRegister.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: view.frame.width, height: view.frame.height)
        
         let infoView = UIStackView(arrangedSubviews: [firstName,lastName])
         infoView.axis = .vertical
         infoView.spacing = 10
         infoView.distribution = .fillEqually
         viewRegister.addSubview(infoView)
         let stackView = UIStackView(arrangedSubviews: [infoView,emailTextField, passwordTextField, signUpButton])
         
         stackView.axis = .vertical
         stackView.spacing = 10
         stackView.distribution = .fillEqually
         
         view.addSubview(stackView)
         stackView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: stackView.frame.height)
        
         
     }
    @objc func formValidation() {
           
           guard
            firstName.hasText,lastName.hasText,
            emailTextField.hasText,
            passwordTextField.hasText == true else {
                signUpButton.isEnabled = false
                signUpButton.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
                   return
           }
           
           signUpButton.isEnabled = true
           signUpButton.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
       }
    @objc func handleSignUp() {
          
           // properties
           guard let email = emailTextField.text else { return }
           guard let password = passwordTextField.text else { return }
           guard let firstname = firstName.text else { return }
           guard let lastname = lastName.text?.lowercased() else { return }
           
    }
     
}
