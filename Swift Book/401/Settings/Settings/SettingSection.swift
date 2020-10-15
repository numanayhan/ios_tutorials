//
//  SettingSection.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation 
enum SettingSection: Int,CaseIterable,CustomStringConvertible{
    case auth
    case addManagment
    case message
    case favorites
    case secureTrade
    case otherSettings
    
    var description: String{
        switch self{
          case .auth : return " "
          case .addManagment : return "Add Managment"
          case .message : return "Messsages"
          case .favorites : return "Favorites"
          case .secureTrade : return "Secure Trade"
          case .otherSettings : return "Other Settings"
        }
    }
    
}

enum AuthSection : Int,CaseIterable,CustomStringConvertible{
     
    case login
    case register
       var description: String{
           switch self{
           case .login : return "Login"
           case .register : return "Register"
       }
    }
}
enum AddManagment: Int,CaseIterable,CustomStringConvertible{
     
  case publish
  case inPublish
  case qrCodeAddImage
     var description: String{
         switch self{
         case .publish : return "Publish"
         case .inPublish : return "In Publish"
         case .qrCodeAddImage : return "QR CODE READ"
         }
     }
}
enum Messages: Int,CaseIterable,CustomStringConvertible{
    
     case addMessage
     case information
     case permission
     case readText
  var description: String{
      switch self{
       case .addMessage : return "Add Messages"
       case .information : return "Information Messages "
       case .permission : return "Messages Permissions"
       case .readText : return "Readed Messages"
      }
  }
}
enum Favorites : Int,CaseIterable,CustomStringConvertible{
    
    case special
    case adds
    case search
    case buyer
    case seller
    case comparison
    var description: String{
      switch self{
       case .special : return "Special"
       case .adds : return "Adds"
       case .search : return "Search"
       case .buyer : return "Buyer"
       case .seller : return "Seller"
       case .comparison : return "Comparison"
      }
    }
}
enum SecureTrade : Int,CaseIterable,CustomStringConvertible{
    case secureTrade
     var description: String{
      switch self{
      case .secureTrade : return "Secure Trade"}
       
    }
}
enum OtherSettings : Int,CaseIterable,CustomStringConvertible{
    
    case settings
    case help
    case issues
    case about
    var description: String{
     switch self{
     case .settings : return "Settings"
       case .help : return "Help"
       case .issues : return "Issues"
       case .about : return "About"
      }
    }
}
