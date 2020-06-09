//
//  ViewController.swift
//  Validation
//
//  Created by TRA on 11.04.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import UIKit
import Foundation
public class Alert: UIView {
    
    public lazy var eightClose:UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 18))
        var image = UIImage(named: "red_close");
        imageView.image = image
        imageView.tintColor = UIColor.red
        self.addSubview(imageView)
        return imageView
    }()
    public lazy var eightText:UILabel = {
        let label = UILabel()
        label.text = "En az 8 karakter uzunluğunda"
        label.textColor = UIColor.red
        label.font = label.font.withSize(10)
        self.addSubview(label)
        return label
    }()
    public lazy var lowerClose:UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 18))
        var image = UIImage(named: "red_close");
        imageView.image = image
        imageView.tintColor = UIColor.red
        self.addSubview(imageView)
        return imageView
    }()
    public lazy var lowerText:UILabel = {
        let label = UILabel()
        label.text = "En az bir küçük harf"
        label.textColor = UIColor.red
        label.font = label.font.withSize(10)
        self.addSubview(label)
        return label
    }()
    public lazy var uppercaseClose:UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 18))
        var image = UIImage(named: "red_close");
        imageView.image = image
        imageView.tintColor = UIColor.red
        self.addSubview(imageView)
        return imageView
    }()
    public lazy var uppercaseText:UILabel = {
        let label = UILabel()
        label.text = "En az bir büyük harf"
        label.textColor = UIColor.red
        label.font = label.font.withSize(10)
        self.addSubview(label)
        return label
    }()
    public lazy var decimalClose:UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 18))
        var image = UIImage(named: "red_close");
        imageView.image = image
        imageView.tintColor = UIColor.red
        self.addSubview(imageView)
        return imageView
    }()
    public lazy var decimalText:UILabel = {
        let label = UILabel()
        label.text = "En az bir sayı"
        label.textColor = UIColor.red
        label.font = label.font.withSize(10)
        self.addSubview(label)
        return label
    }()
    
    public lazy var specialClose:UIImageView = {
           var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 18))
           var image = UIImage(named: "red_close");
           imageView.image = image
           imageView.tintColor = UIColor.red
           self.addSubview(imageView)
           return imageView
       }()
       public lazy var specialText:UILabel = {
           let label = UILabel()
           label.text = "En az bir özel karakter \n (ör: !@#$%^&*)"
           label.textColor = UIColor.red
           label.font = label.font.withSize(10)
        label.numberOfLines  = 2
           self.addSubview(label)
        
           return label
       }()
    public  var infoView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = UIColor.init(white: 0.97, alpha: 1.0)
        return view
    }()
    public  lazy var infoText: UIView = {
        let label = UILabel()
        label.text = "Belirtilen 4 farklı tipe göre şifrenizi oluşturunuz"
        label.textColor = UIColor.red
        label.font = label.font.withSize(9)
        
         self.addSubview(label)
        return label
    }()
    func createDialog() {
        
        self.addSubview(infoView)
        self.addSubview(eightClose)
        self.addSubview(eightText)
        self.addSubview(lowerClose)
        self.addSubview(lowerText)
        self.addSubview(uppercaseClose)
        self.addSubview(uppercaseText)
        self.addSubview(decimalClose)
        self.addSubview(decimalText)
        self.addSubview(specialClose)
        self.addSubview(specialText)
        infoView.anchor(top:   nil, left:nil, bottom: nil, right: nil, paddingTop:   10, paddingLeft:  0, paddingBottom:  0, paddingRight:  0, width:200, height: 240)
        infoText.anchor(top:   infoView.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:   10, paddingLeft:  25, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        
        eightClose.anchor(top:   infoView.topAnchor, left:infoView.leftAnchor, bottom: nil, right: nil, paddingTop:  40, paddingLeft:  13, paddingBottom:  0, paddingRight:  0, width:18, height: 18)
        
        eightText.anchor(top:   infoView.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:    32, paddingLeft:  45, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        
        lowerClose.anchor(top:   eightClose.topAnchor, left:infoView.leftAnchor, bottom: nil, right: nil, paddingTop:  30, paddingLeft:  13, paddingBottom:  0, paddingRight:  0, width:18, height: 18)
        
        lowerText.anchor(top:   eightText.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:   32, paddingLeft:  45, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        
        uppercaseClose.anchor(top:   lowerClose.topAnchor, left:infoView.leftAnchor, bottom: nil, right: nil, paddingTop:   30, paddingLeft:  13, paddingBottom:  0, paddingRight:  0, width:18, height: 18)
        
        uppercaseText.anchor(top:   lowerText.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:   30, paddingLeft:  45, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        decimalClose.anchor(top:   uppercaseClose.topAnchor, left:infoView.leftAnchor, bottom: nil, right: nil, paddingTop:   30, paddingLeft:  13, paddingBottom:  0, paddingRight:  0, width:18, height: 18)
        decimalText.anchor(top:   uppercaseText.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:   28, paddingLeft:  45, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        
        specialClose.anchor(top:   decimalClose.topAnchor, left:infoView.leftAnchor, bottom: nil, right: nil, paddingTop:   30, paddingLeft:  13, paddingBottom:  0, paddingRight:  0, width:18, height: 18)
        specialText.anchor(top:   decimalText.topAnchor, left:infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop:   27, paddingLeft:  45, paddingBottom:  0, paddingRight:  10, width:infoView.frame.width - 10, height: 30)
        
        
        
    }
    
    
}
class ViewController: UIViewController ,UITextFieldDelegate  {
    @IBOutlet weak var emailText: UITextField! {
        didSet {
            emailText.tintColor = UIColor.lightGray
            emailText.setIcon(UIImage.init(named: "user")!)
            emailText.borderStyle = .roundedRect
            emailText.layer.cornerRadius = 2.0;
            emailText.layer.borderWidth = 0.1;
            emailText.leftViewMode = .always
            emailText.attributedPlaceholder =   NSAttributedString(string:"E-mail",  attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            emailText.backgroundColor =  UIColor.black
            emailText.textColor = .white
        }
    }
    @IBOutlet weak var passwordText: UITextField!{
        didSet {
            passwordText.setIcon(UIImage.init(named: "password")!)
            passwordText.tintColor = UIColor.lightGray
            passwordText.borderStyle = .roundedRect
            passwordText.layer.cornerRadius = 2.0;
            passwordText.layer.borderWidth = 0.1;
            passwordText.leftViewMode = .always
            
        }
    }
    lazy var infoPwd:   UIView = {
        let stackView        = UIView()
        var tfText           = UILabel()
        var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        var image = UIImage(named: "red_close");
        imageView.image = image
        imageView.tintColor = .red
        
        stackView.addSubview(imageView)
        stackView.layer.cornerRadius = 2
        stackView.backgroundColor =  UIColor.init(white: 0.95, alpha: 1.0)
        
        return  stackView
    }()
    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var ibanText: UITextField!
    @IBOutlet weak var currencyText: UITextField!
    var validType : String.ValidityType = .password
    
    var alert  = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailText.delegate = self
         
        ibanText.delegate = self
    }
    @IBAction func pwdBegin(_ sender: UITextField) {
         self.alert.alpha = 1.0
        //        self.infoPwd.alpha = 1
        //        view.addSubview(infoPwd)
        //        infoPwd.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        //        infoPwd.anchor(top:   passwordText.bottomAnchor, left:nil, bottom: nil, right: passwordText.rightAnchor, paddingTop:   10, paddingLeft:  0, paddingBottom:  0, paddingRight:  0, width:200, height: 200)
        
        alert.createDialog()
        self.view.addSubview(alert)
        alert.anchor(top: passwordText.bottomAnchor, left: nil, bottom: nil, right: passwordText.rightAnchor, paddingTop: 7, paddingLeft:0, paddingBottom: 0, paddingRight:   10 , width: 200, height: 240)
        
    }
    
    @IBAction func pwdEnd(_ sender: UITextField) {
       UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.alert.alpha = 0
        }, completion: nil)
    }
    @IBAction func getPassword(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let lenghtMatches =  text.count
        let uppercaseMatches = self.isMathces(for: "[A-Z]", in: text)
        let lowerMatches = self.isMathces(for: "[a-z]", in: text)
        let decimalMatches = self.isMathces(for: "[0-9]", in: text)
        let specialMatches = self.isMathces(for: "[!@#$%^&*]", in: text)
        if lenghtMatches > 7 {
            alert.eightClose.tintColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.eightText.textColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.eightClose.image =  UIImage(named: "verify")
        }else {
            alert.eightClose.tintColor = UIColor.red
            alert.eightText.textColor = UIColor.red
            alert.eightClose.image =  UIImage(named: "red_close")
        }
        
        if lowerMatches.count > 0 {
            alert.lowerClose.tintColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.lowerText.textColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
        }else{
            alert.lowerClose.tintColor = UIColor.red
            alert.lowerText.textColor = UIColor.red
        }
        if uppercaseMatches.count > 0 {
            alert.uppercaseClose.tintColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.uppercaseText.textColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
        }else {
            alert.uppercaseClose.tintColor = UIColor.red
            alert.uppercaseText.textColor = UIColor.red
        }
        if decimalMatches.count > 0 {
            alert.decimalClose.tintColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.decimalText.textColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
        }else {
            alert.decimalClose.tintColor = UIColor.red
            alert.decimalText.textColor = UIColor.red
        }
        if specialMatches.count > 0 {
            alert.specialClose.tintColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
            alert.specialText.textColor = UIColor.init(red: 126/255, green: 173/255, blue: 68/255, alpha: 1.0)
        }else {
            alert.specialClose.tintColor = UIColor.red
            alert.specialText.textColor = UIColor.red
        }
        
    }
    //TR00-0000-0000-0000-0000-00
    
    
    @IBAction func infoPassword(_ sender: UIButton) {
        
        
    }
    @objc func close(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.infoPwd.alpha = 0
        }, completion: nil)
    }
    @IBAction func ibanEditBegun(_ sender: UITextField) {
        if !ibanText.text!.contains("TR") {
            ibanText.text = "TR"
        }
        
    }
    func format(ibanNo: String, shouldRemoveLastDigit: Bool = false) -> String {
        guard !ibanNo.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: ibanNo).range(of: ibanNo)
        var number = regex.stringByReplacingMatches(in: ibanNo, options: .init(rawValue: 0), range: r, withTemplate: "")
        
        if number.count > 26{
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 26)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }
        
        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }
        if number.count < 5 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "$1", options: .regularExpression, range: range)
        }
        if number.count < 11 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "$1-$2", options: .regularExpression, range: range)
        }
            
        else if number.count < 15 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d+)", with: "$1-$2-$3", options: .regularExpression, range: range)
        }
        else if number.count < 19 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d{4})(\\d+)", with: "$1-$2-$3-$4", options: .regularExpression, range: range)
        }
        else if number.count < 23 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d{4})(\\d{4})(\\d+)", with: "$1-$2-$3-$4-$5", options: .regularExpression, range: range)
        }
        else if number.count < 26 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d{4})(\\d{4})(\\d{4})(\\d+)", with: "$1-$2-$3-$4-$5-$6", options: .regularExpression, range: range)
        }
        else if number.count < 29{
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d{4})(\\d{4})(\\d{4})(\\d{4})(\\d+)", with: "$1-$2-$3-$4-$5-$6-$7", options: .regularExpression, range: range)
        }
        return number
    }
    func isIBAN(for regex:String,in text:String) -> [String]{
        do{
            let regex = try! NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex...,in:text))
            return results.map({
                String(text[Range($0.range,in:text)!])
            })
        }
    }
    
    func isMathces(for regex:String,in text:String) -> [String]{
        
        do{
            let regex = try! NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex...,in:text))
            return results.map({
                String(text[Range($0.range,in:text)!])
            })
        }
    }
    func isLowercase(for regex:String,in text:String) -> [String]{
        
        do{
            let regex = try! NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex...,in:text))
            return results.map({
                String(text[Range($0.range,in:text)!])
            })
        }
    }
    func isPasswordValidUppercase(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])$")
        return passwordTest.evaluate(with: password)
    }
    
    func validate(pwd:String?) ->String?{
        let lenght:Int = pwd?.count ?? 0 
        //        if lenght >= 8 {
        //            print("password is valid 8 charackter")
        //        }
        if (pwd?.isValid(validType))! {
            print("password  one uppercase")
        }else{
            print("wronge")
        }
        
        return ""
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text! == emailText.text!){
            
            return true
        }else if (textField.text == passwordText.text){
            
            return true
        }else if textField == ibanText {
            var fullString = textField.text ?? ""
            fullString.append(string)
            if range.length == 1 {
                textField.text = format(ibanNo: fullString, shouldRemoveLastDigit: true)
            } else {
                textField.text = format(ibanNo: fullString)
            }
            return false
        }
        return false
    }
    
    
}

