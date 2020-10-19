//
//  Forgot.swift
//  Settings
//
//  Created by Melike Büşra Ayhan on 18.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class Forgot: UIViewController ,UITextFieldDelegate{
    var heightTitles =  0
    lazy var  titleForgot : UILabel = {
        let  title = UILabel()
        title.text =   "Yeni Şifrenizi Oluşturun"
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor  = .black
        return title
    }()
    lazy var  subTitle : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 13)
        let attributedTitle = NSMutableAttributedString(string: "Üye olurken verdiğiniz e-posta adresinizi yazınız. Şifreniz e-posta adresinize gönderilecektir.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        title.textColor  = .black
        title.text = attributedTitle.string
        title.textAlignment = .justified
        title.numberOfLines = 0
        return title
    }()
    lazy var  emailTitle : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 11)
        let attributedTitle = NSMutableAttributedString(string: "E-posta Adresi", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        title.textColor  = .darkGray
        title.text = attributedTitle.string
        title.textAlignment = .left
        title.frame = CGRect.init(x: 0, y: 0, width: 0, height: 20)
        return title
    }()
   let email : UITextField = {
          let tf = UITextField()
           tf.placeholder = "E-posta Adresi"
           tf.backgroundColor  =  .white
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
    let forgot : UIButton = {
             let btn  =  UIButton()
             btn.setTitle("Devam Et", for: .normal)
             btn.setTitleColor(UIColor.white, for: .normal)
             btn.layer.cornerRadius = 2
             btn.backgroundColor = UIColor.init(named: "before")
             btn.titleLabel?.font = UIFont.systemFont(ofSize:14)
             btn.addTarget(self, action: #selector(setForgot), for: .touchUpInside)
             return btn
    }()
    var topBarHeight:CGFloat? = 44
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(named:"input")
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavbar()
        setStackView()
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
    func setStackView(){
        let containerView = UIStackView(arrangedSubviews: [titleForgot,subTitle])
        containerView.backgroundColor = .lightGray
        containerView.axis = .vertical
        containerView.spacing = 10
        containerView.distribution = .fillEqually
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: self.topBarHeight! + 20, paddingLeft:10, paddingBottom: 0, paddingRight: 10, width: view.frame.width, height: CGFloat(heightTitles))
          
         
        email.layer.addRadius(radius: 1)
        email.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [emailTitle,email, forgot])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 140)
        
        emailTitle.anchor(top: stackView.topAnchor, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 10)
        email.anchor(top: emailTitle.bottomAnchor, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45)
        forgot.anchor(top: email.bottomAnchor, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45)
        
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
    func startLoading(){
        forgot.setTitle(" ", for: .normal)
        forgot.loading(true)
    }
    func stopLoading(){
        forgot.setTitle("Devam Et", for: .normal)
        forgot.loading(false)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        self.forgot.setTitle("Devam Et", for: .normal)
        self.forgot.loading(false)
    }
    @objc func setForgot(){
        print("setForgot")
    }
}
