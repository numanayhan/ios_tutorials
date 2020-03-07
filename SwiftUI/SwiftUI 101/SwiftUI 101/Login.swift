//
//  Login.swift
//  SwiftUI 101
//
//  Created by TRA on 28.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class Login: UIViewController , UITextFieldDelegate{
    @IBOutlet  weak var detail : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        detail.delegate = self
        // Do any additional setup after loading the view.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if (textField.text! == detail.text!) {
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
        return false
        
    }
     
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
