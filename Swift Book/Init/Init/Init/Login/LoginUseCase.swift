//
//  LoginUseCase.swift
//  Init
//
//  Created by nayhan on 22.09.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation

protocol LoginUseCaseOut {
    func success()
    func failed()
}
class LoginUseCase {
    
    let outPuts: LoginUseCaseOut
    
    init(outPuts: LoginUseCaseOut
         ) {
        self.outPuts = outPuts
       
    }
    func login(email:String,pwd:String){
        //if success
        outPuts.success()
        //if failed
        outPuts.failed()
    }
}
