//
//  Register.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
import CustomUISwitch
class Register: UIViewController {
    let containerView: UIView = {
           let viewBar = UIView()
           let title = UILabel()
           title.text =   "Üye Olun"
           title.font = UIFont.boldSystemFont(ofSize: 20)
           viewBar.addSubview(title)
           title.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: title.frame.width, height: title.frame.height)
           title.leftAnchor.constraint(equalTo: viewBar.leftAnchor,constant: 0).isActive = true
           title.centerYAnchor.constraint(equalTo: viewBar.centerYAnchor).isActive = true
           return viewBar
   }()
    let firstName: UITextField = {
           let tf = UITextField()
           tf.placeholder = "First Name"
           tf.borderStyle = .roundedRect
           tf.font = UIFont.systemFont(ofSize: 14)
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
       
       let lastName: UITextField = {
           let tf = UITextField()
           tf.placeholder = "Last Name"
           tf.borderStyle = .roundedRect
           tf.font = UIFont.systemFont(ofSize: 14)
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
    let email: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
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
    
    
    let phone : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Gsm"
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
    let password: UITextField = {
        let tf = UITextField()
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
    let confirmPassword: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Şifrenizi Doğrulayın"
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
    let register: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Üye Ol", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 2
        btn.backgroundColor = UIColor.init(named: "before")
        btn.titleLabel?.font = UIFont.systemFont(ofSize:14)
        btn.addTarget(self, action: #selector(validation), for: .touchUpInside)
        return btn
    }()
    let acceptRules: UISwitch = {
        let cs = UISwitch()
        cs.translatesAutoresizingMaskIntoConstraints = false
        cs.onTintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        cs.thumbTintColor = UIColor.init(named: "before")
        cs.isOn = true
        return cs
    }()
    let rulesView : UIView = {
        
        let viewRules = UIView()
        
        let rulesText = UIButton()
        let rulesAccept = UILabel()
        
        let attributedTitle = NSMutableAttributedString(string: "Üyelik Sözleşmesi'", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        rulesText.setTitle(attributedTitle.string, for: .normal)
        
        let attributedTitleAccept = NSMutableAttributedString(string: "ni kabul ediyorum", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        rulesAccept.attributedText = attributedTitleAccept
        let infoView = UIStackView(arrangedSubviews: [rulesText,rulesAccept])
        infoView.axis = .horizontal
        infoView.spacing = 0
        viewRules.addSubview(infoView)
        infoView.anchor(top: viewRules.topAnchor, left: viewRules.leftAnchor, bottom: viewRules.bottomAnchor, right: viewRules.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: viewRules.frame.width, height: 40)
        
        
        return viewRules
    }()
    var topBarHeight:CGFloat? = 44
    var isRules : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
        view.backgroundColor = UIColor.init(named:"input")
        setNavbar()
        setComponents()
       
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
    @objc func setRules(){
        print("setRules")
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
    func setComponents() {
        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: self.topBarHeight! + 20, paddingLeft:10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
        firstName.layer.addRadius(radius: 1)
        lastName.layer.addRadius(radius: 1)
        email.layer.addRadius(radius: 1)
        phone.layer.addRadius(radius: 1)
        password.layer.addRadius(radius: 1)
        confirmPassword.layer.addRadius(radius: 1)
        
        firstName.backgroundColor = .white
        lastName.backgroundColor = .white
        email.backgroundColor = .white
        phone.backgroundColor = .white
        password.backgroundColor = .white
        confirmPassword.backgroundColor = .white
        
        let infoView = UIStackView(arrangedSubviews: [firstName,lastName])
        infoView.axis = .horizontal
        infoView.spacing = 10
        infoView.distribution = .fillEqually
        view.addSubview(infoView)
        infoView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 40)
        
        let stackView = UIStackView(arrangedSubviews: [email,phone,password,confirmPassword])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
        
        
        let rulesContent = UIStackView(arrangedSubviews: [acceptRules,rulesView])
        rulesContent.axis = .horizontal
        rulesContent.spacing =  10
        rulesContent.distribution = .fill
        view.addSubview(rulesContent)
        rulesContent.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop:  10  , paddingLeft: 20, paddingBottom: 0, paddingRight:  10, width: view.frame.width, height:40)
        
     }
    @objc func validation() {
          
           // properties
           guard let email = email.text else { return }
           guard let password = password.text else { return }
           guard let firstname = firstName.text else { return }
           guard let lastname = lastName.text?.lowercased() else { return }
           guard let phone = phone.text else { return }
        
            if (firstname.isEmpty){
                 stopLoading()
                 self.setNotify("Adınızı girmelisiniz")
            } else if(lastname.isEmpty){
                 stopLoading()
                 self.setNotify("Soyadınızı girmelisiniz")
            } else if(email.isEmpty){
                stopLoading()
                self.setNotify("E-postanızı girmelisiniz")
            } else if(password.isEmpty){
                stopLoading()
                self.setNotify("Şifrenizi oluşturun")
            } else if(phone.isEmpty){
                stopLoading()
                self.setNotify("Telefon No girmelisiniz")
            } else if(password.isEmpty){
                stopLoading()
                self.setNotify("Şifrenizi tekrar girin")
            }  else if(password.count > 4 ){
                stopLoading()
                self.setNotify("Şifrenizi tekrar girin")
            }else if(isRules == true){
                stopLoading()
                self.setNotify("Üyelik Sözleşmenizi kabul ediniz")
            } else{
                setRequest()
            }
    }
    func setRequest(){
        print("setRequest")
    }
    func startLoading(){
        register.setTitle(" ", for: .normal)
        register.loading(true)
    }
    func stopLoading(){
        register.setTitle("Üye Ol", for: .normal)
        register.loading(false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        title  = " "
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
        self.register.setTitle("Giriş yap", for: .normal)
        self.register.loading(false)
    }
}
