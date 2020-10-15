//
//  SearchSection.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
enum SearchSection: Int,CaseIterable,CustomStringConvertible{
    case categories
    case addManagment
    case message
    case favorites
    case secureTrade
    case otherSettings
    
    var description: String{
        switch self{
          case .categories : return " "
          case .addManagment : return "Add Managment"
          case .message : return "Messsages"
          case .favorites : return "Favorites"
          case .secureTrade : return "Secure Trade"
          case .otherSettings : return "Other Settings"
        }
    }
    
}
 
