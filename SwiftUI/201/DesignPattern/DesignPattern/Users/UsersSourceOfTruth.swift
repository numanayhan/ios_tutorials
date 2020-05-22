//
//  UsersSourceOfTruth.swift
//  DesignPattern
//
//  Created by TRA on 13.04.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import Foundation

class UsersSourceOfTruth: ObservableObject {
    @Published var users = [User]()
    
}
