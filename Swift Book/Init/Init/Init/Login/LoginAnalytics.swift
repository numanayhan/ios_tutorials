//
//  LoginAnalytics.swift
//  Init
//
//  Created by nayhan on 22.09.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation
final class LoginAnalytics: LoginUseCaseOut{
    func success() {
        print("LoginAnalytics : s")
    }
    
    func failed() {
          print("LoginAnalytics : f")
    }
    
    
}
