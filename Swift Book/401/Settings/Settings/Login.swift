//
//  Login.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
import PinLayout
class Login: UIViewController ,UITextFieldDelegate{
     let logoContainerView: UIView = {
            let viewBar = UIView()
            let title = UILabel()
            title.text =   "Üye Giriş Yapın"
            title.font = UIFont.boldSystemFont(ofSize: 20)
            viewBar.addSubview(title)
            title.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: title.frame.width, height: title.frame.height)
            title.leftAnchor.constraint(equalTo: viewBar.leftAnchor,constant: 0).isActive = true
            title.centerYAnchor.constraint(equalTo: viewBar.centerYAnchor).isActive = true
            return viewBar
    }()
    let email : UITextField = {
           let tf = UITextField()
            tf.placeholder = "E-posta Adresi"
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
            tf.autocapitalizationType = .none
            return tf
     }()
    var rightButton  = UIButton(type: .system)
    
     lazy var password : UITextField = {
        let tf  = UITextField()
        tf.placeholder = "Şifre"
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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
        imageView.image =  UIImage(named: "hide")
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24 ))
        imageContainerView.addSubview(imageView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(tapGestureRecognizer:)))
        imageContainerView.isUserInteractionEnabled = true
        imageContainerView.addGestureRecognizer(tapGestureRecognizer)
        tf.rightView = imageContainerView
        tf.rightViewMode = .always
        
        return tf
    }()
    let forgot : UIButton = {
              let btn  = UIButton()
              btn.setTitle("Şifremi Unuttum?", for: .normal)
              btn.setTitleColor(UIColor.init(named: "text"), for: .normal)
              btn.titleLabel?.font = UIFont.systemFont(ofSize:12)
              btn.contentHorizontalAlignment = .left
              btn.addTarget(self, action: #selector(setForgot), for: .touchUpInside)
             return btn
    }()
    let login : UIButton = {
             let btn  =  UIButton()
             btn.setTitle("Giriş yap", for: .normal)
             btn.setTitleColor(UIColor.white, for: .normal)
             btn.layer.cornerRadius = 2
             btn.backgroundColor = UIColor.init(named: "before")
             btn.titleLabel?.font = UIFont.systemFont(ofSize:14)
             btn.addTarget(self, action: #selector(setLogin), for: .touchUpInside)
             return btn
    }()
    let ifRegister : UIButton = {
             let btn  =  UIButton()
             btn.setTitle("Üye Ol", for: .normal)
             btn.setTitleColor(UIColor.init(named: "before"), for: .normal)
             btn.layer.cornerRadius = 2
             btn.layer.borderWidth = 1
             btn.layer.borderColor = UIColor.init(named: "before")?.cgColor
             btn.titleLabel?.font = UIFont.systemFont(ofSize:14)
             btn.addTarget(self, action: #selector(setRegister), for: .touchUpInside)
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
       
    }
    override func viewWillAppear(_ animated: Bool) {
          
        email.keyboardType = .emailAddress
        
        view.backgroundColor = UIColor.init(named:"input")
        
        setNavbar()
        setStackView()
    }
    @objc func setLogin(){
        
        startLoading()
        view.endEditing(true)
        
        guard let eml  = email.text else { return }
        guard let pwd  = password.text  else { return }
        if (eml.isEmpty){
             stopLoading()
             self.setNotify("E-posta adresi girmelisiniz")
        } else if(pwd.isEmpty){
             stopLoading()
             self.setNotify("Şifrenizi girmelisiniz")
        }else{
             setLoginRequest()
        }
    }
    @objc func showPassword(tapGestureRecognizer: UITapGestureRecognizer) {
        let security = password.isSecureTextEntry
        if security == true {
            password.isSecureTextEntry = false
             
            let imageView = UIImageView(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
            imageView.image =  UIImage(named: "hide")
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24 ))
            imageContainerView.addSubview(imageView)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(tapGestureRecognizer:)))
            imageContainerView.isUserInteractionEnabled = true
            imageContainerView.addGestureRecognizer(tapGestureRecognizer)
            password.rightView = imageContainerView
            password.rightViewMode = .always
        }else if security == false {
            password.isSecureTextEntry = true
            let imageView = UIImageView(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
            imageView.image =  UIImage(named: "hide")
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24 ))
            imageContainerView.addSubview(imageView)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(tapGestureRecognizer:)))
            imageContainerView.isUserInteractionEnabled = true
            imageContainerView.addGestureRecognizer(tapGestureRecognizer)
            password.rightView = imageContainerView
            password.rightViewMode = .always
        }
    }
    @objc func setRegister(){
        let upload = Register()
        navigationController?.pushViewController(upload, animated: true)
    }
    @objc func setForgot(){
        let upload = Forgot()
        navigationController?.pushViewController(upload, animated: true)
    }
    func startLoading(){
        login.setTitle(" ", for: .normal)
        login.loading(true)
    }
    func stopLoading(){
        login.setTitle("Giriş yap", for: .normal)
        login.loading(false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        title  = " "
    }
    func setStackView(){
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: self.topBarHeight! + 20, paddingLeft:10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
        
        email.layer.addRadius(radius: 1)
        password.layer.addRadius(radius: 1)
     
        email.backgroundColor = .white
        password.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [email,password,forgot,login,ifRegister])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 240)
           
    }
    func setNavbar() {
        if (navigationController?.navigationBar != nil){
            self.topBarHeight = navigationController!.navigationBar.frame.height
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
             defaultRequest.postParamsRequest( url:Config.isInit  , parameters: parameters , completion : { data in
                DispatchQueue.main.async {
                    let res = data as? NSDictionary
                    print(res)
                        if res!["status"] as? Int != 200 {
                            print(res!["status"])
                            guard let auth = res!["authorized"] as? Int else {return}
                            print(auth)
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
            print("else")
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
        self.login.setTitle("Giriş yap", for: .normal)
        self.login.loading(false)
    }
}
