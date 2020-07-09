//
//  UsersCV.swift
//  DesignPattern
//
//  Created by TRA on 13.04.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import SwiftUI

struct UsersCV: View {
    @ObservedObject var sot:UsersSourceOfTruth
    
    var body: some View {
        List(sot.users){ user in
            Text()
            
        }
    }
}
 
