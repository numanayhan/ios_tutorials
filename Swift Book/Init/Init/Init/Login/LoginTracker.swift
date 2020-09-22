//
//  LoginTracker.swift
//  Init
//
//  Created by nayhan on 22.09.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation

final class LoginTracker : LoginUseCaseOut{
    func success() {
        print("LoginTracker : s")
    }
    func failed() {
        print("LoginTracker : f")
    }
    
    
}
