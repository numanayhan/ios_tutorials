//
//  ViewController.swift
//  RxSwift_RxCocoa
//
//  Created by TRA on 25.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var greetingsLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    private let throttleInterval = 0.1
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var logInButton: UIButton!
    
    @IBOutlet weak var priceOutlet     : UITextField!
    @IBOutlet weak var cryptoOutlet    : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.cryptoOutlet.delegate = self
        self.priceOutlet.delegate = self
        let emailValid = emailTextfield
            .rx
            .text // 1
            .orEmpty // 2
            .map { self.validateEmail(with: $0) }
            .share(replay: 1) // 5
        
        let passwordValid = passwordTextfield.rx.text.orEmpty
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        let everythingValid = Observable
            .combineLatest(emailValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        everythingValid
            .bind(to: logInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting
        formatter.locale = Locale(identifier: "US")
         
        
    }
    @IBAction func selectCharacter(_ sender: Any) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as! Detail
        
        
        detailVC.selectedCharacter
            .subscribe(onNext: { [weak self] character in
                self?.greetingsLabel.text = "Hello \(character)"
            }).disposed(by: disposeBag)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    private func validateEmail(with email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@([A-Za-z0-9.-]{2,64})+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        
        return predicate.evaluate(with: email)
    }
    @IBAction private func logInButtonPressed() {
        print(emailTextfield.text)
        print(passwordTextfield.text)
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text! == priceOutlet.text!) {
            guard let oldText = textField.text, let r = Range(range, in: oldText) else {
                return true
            }
            let newText = oldText.replacingCharacters(in: r, with: string)
            let isNumeric = newText.isEmpty || (Double(newText) != nil)
            let numberOfDots = newText.components(separatedBy: ".").count - 1
            
            let numberOfDecimalDigits: Int
            if let dotIndex = newText.firstIndex(of: ".") {
                numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
            } else {
                numberOfDecimalDigits = 0
            }
            return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
        }
        if (textField.text! == cryptoOutlet.text!)   {
            guard let oldText = textField.text, let r = Range(range, in: oldText) else {
                return true
            }
            let newText = oldText.replacingCharacters(in: r, with: string)
            let isNumeric = newText.isEmpty || (Double(newText) != nil)
            let numberOfDots = newText.components(separatedBy: ".").count - 1
            
            let numberOfDecimalDigits: Int
            if let dotIndex = newText.firstIndex(of: ".") {
                numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
            } else {
                numberOfDecimalDigits = 0
            }
            return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 8
        }
        return false
    }
    @IBAction func setBuy(_ sender: Any) {
        print(cryptoOutlet.text)
        print(priceOutlet.text)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
