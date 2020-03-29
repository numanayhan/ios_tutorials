//
//  Detail.swift
//  RxSwift_RxCocoa
//
//  Created by TRA on 25.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import RxSwift

class Detail: UIViewController {
    private let selectedCharacterVariable = Variable("User")
    var selectedCharacter:Observable<String> {
        return selectedCharacterVariable.asObservable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    @IBAction func characterSelected(_ sender: UIButton) {
           guard let characterName = sender.titleLabel?.text else {return}
           
           selectedCharacterVariable.value = characterName
            
           
       }
}
