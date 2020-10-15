//
//  Login.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class Login: UIViewController ,UITextFieldDelegate{
     let logoContainerView: UIView = {
            let viewBar = UIView()
            let title = UILabel()
            title.text =   String.localize("signin") 
            title.font = UIFont.systemFont(ofSize: 20)
            viewBar.addSubview(title)
            title.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: title.frame.width, height: title.frame.height)
            title.leftAnchor.constraint(equalTo: viewBar.leftAnchor,constant: 0).isActive = true
            title.centerYAnchor.constraint(equalTo: viewBar.centerYAnchor).isActive = true
            return viewBar
    }()
    let email : UITextField = {
           let tf = UITextField()
            tf.placeholder = String.localize("email")
            tf.backgroundColor  =  UIColor(named: "input")
            tf.font = UIFont.systemFont(ofSize:14)
            tf.keyboardType = .emailAddress
            tf.setLeftPaddingPoints(10)
            tf.setRightPaddingPoints(10)
            tf.borderStyle = .roundedRect
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: tf.frame.height - 1, width: tf.frame.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.white.cgColor
            tf.borderStyle = UITextField.BorderStyle.none
            tf.layer.addSublayer(bottomLine)
            return tf
     }()
     lazy var password : UITextField = {
             let tf  = UITextField()
              tf.placeholder = String.localize("password")
              tf.backgroundColor  =  UIColor(named: "input")
              tf.font = UIFont.systemFont(ofSize:14)
              tf.isSecureTextEntry = true
              tf.setLeftPaddingPoints(10)
              tf.setRightPaddingPoints(10)
              tf.borderStyle = .roundedRect
              var bottomLine = CALayer()
              bottomLine.frame = CGRect(x: 0.0, y: tf.frame.height - 1, width: tf.frame.width, height: 1.0)
              bottomLine.backgroundColor = UIColor.white.cgColor
              tf.borderStyle = UITextField.BorderStyle.none
              tf.layer.addSublayer(bottomLine)
              return tf
    }()
    let forgot : UIButton = {
              let btn  = UIButton()
              btn.setTitle(NSLocalizedString("forgot",comment: ""), for: .normal)
              btn.setTitleColor(UIColor.init(named: "text"), for: .normal)
              btn.titleLabel?.font = UIFont.systemFont(ofSize:12)
              btn.contentHorizontalAlignment = .left
            
             return btn
    }()
    let login : UIButton = {
             let btn  =  UIButton()
             btn.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
             btn.setTitleColor(UIColor.white, for: .normal)
             btn.layer.cornerRadius = 2
             btn.backgroundColor = UIColor.init(named: "before")
             btn.titleLabel?.font = UIFont.systemFont(ofSize:14)
             btn.addTarget(self, action: #selector(setLogin), for: .touchUpInside)
              return btn
    }()
    let headerColor = UIColor.init(named: "headerBar")
    var topBarHeight:CGFloat? = 44
    let scrollView: UIScrollView = {
         let v = UIScrollView()
         v.backgroundColor = .white
         return v
    }()
    let defaultRequest = DefaultRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setNavbar()
        setStackView()
    }
    @objc func setLogin(){
        
        startLoading()
        
        guard let eml  = email.text else { return }
        guard let pwd  = password.text  else { return }
        if (eml.isEmpty){
             stopLoading()
             self.setNotify(String.localize("haveToEmailText"))
        } else if(pwd.isEmpty){
             stopLoading()
             self.setNotify(String.localize("haveToPasswordText"))
        }else{
             
             setLoginRequest()
        }
    }
    func startLoading(){
        login.setTitle(" ", for: .normal)
        login.loading(true)
    }
    func stopLoading(){
        login.setTitle(String.localize("login"), for: .normal)
        login.loading(false)
    }
    func setStackView(){
           view.addSubview(logoContainerView)
           logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: self.topBarHeight! + 20, paddingLeft:10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
           let stackView = UIStackView(arrangedSubviews: [email,password,forgot,login])
           stackView.axis = .vertical
           stackView.spacing = 10
           stackView.distribution = .fillEqually
           view.addSubview(stackView)
           stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
           email.layer.addRadius(radius: 3)
           password.layer.addRadius(radius: 3)
        
    }
    func setNavbar() {
        if (navigationController?.navigationBar != nil){
            self.topBarHeight = navigationController!.navigationBar.frame.height
            title = String.localize("login")
            self.navigationController!.navigationBar.tintColor = UIColor.black
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.backgroundColor  = UIColor.clear
            self.navigationController?.navigationBar.shadowImage = UIImage()
            
        }
    }
    func setLoginRequest(){
        guard let userHash  = UserDefaults.standard.string(forKey: "userHash") else {return}
        guard let email  = email.text else { return }
        guard let pwd  = password.text  else { return }
        if Network.isConnectedToNetwork() == true {
            let parameters  = [ "userHash" : userHash,"email":email,"password":pwd]
             defaultRequest.postParamsRequest( url:Config.isLogin  , parameters: parameters , completion : { data in
                DispatchQueue.main.async { 
                    let res = data as? NSDictionary
                        if res!["status"] as? Int != 200 {
                            guard let auth = res!["authorized"] as? Int else {return}
                            if auth  == 1{
                                 UserDefaults.standard.set(false, forKey: "authorized")
                            }
                        }else{
                            self.setNotify(String.localize("errorLogin"))
                        }
                     self.login.setTitle("Login", for: .normal)
                    self.login.loading(false)
                }
            })
        }else{
            
        }
    }
    func setNotify(_ text:String){
        let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
        alert.modalPresentationStyle = .overCurrentContext
        self.present(alert, animated: true)
        let duration: Double = 1.2
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        self.login.setTitle("Login", for: .normal)
        self.login.loading(false)
    }
     
}
