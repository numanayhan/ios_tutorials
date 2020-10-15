//
//  Extentions.swift
//  CustomCell
//
//  Created by nayhan on 14.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation

import UIKit
extension UIView{
    func pin(to superView:UIView) {
        translatesAutoresizingMaskIntoConstraints  = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
    }
}
