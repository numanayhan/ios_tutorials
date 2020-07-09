//
//  UsersVC.swift
//  DesignPattern
//
//  Created by TRA on 13.04.2020.
//  Copyright © 2020 tra. All rights reserved.
//

import SwiftUI

class UsersVC: UIHostingController<UsersCV> {
    let network : NetService
    override init(rootView: UsersCV) {
        self.network = NetService()
        super.init(rootView: rootView)
    }
    @objc required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
    }
    func getUsers(){
        network.getUsers{ users in
            print(users)
        }
    }
}
 
