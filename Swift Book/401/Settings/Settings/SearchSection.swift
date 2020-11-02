//
//  SearchSection.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
enum SearchSection: Int,CaseIterable,CustomStringConvertible{
    case search
    case categories
    case emergency
    case interested
    case near
    case lastSearch
    case lastVisit 
    var description: String{
        switch self{
          case .search: return ""
          case .categories : return " ARAMA"
          case .emergency : return "ACİL"
          case .interested : return "İLGİLENEBİLECEĞİNİZ İLANLAR"
          case .near : return "YAKININIZDAKİ ALIŞVERİŞ İLANLARI"
          case .lastSearch : return "SON ARAMANIZA UYGUN İLANLAR"
          case .lastVisit : return "SON GEZDİĞİNİZ İLANLAR"
        }
    }
    
}
enum Searching : Int,CaseIterable,CustomStringConvertible{
      
    case title
       var description: String{
           switch self{
           case .title : return ""
       }
    }
}
enum CategoriesSection : Int,CaseIterable,CustomStringConvertible{
      
    case title
       var description: String{
           switch self{
           case .title : return ""
       }
    }
}
enum EmergencySection : Int,CaseIterable,CustomStringConvertible{
    
    case emergency
    case fallingPrice
    case last48hours
       var description: String{
           switch self{
           case .emergency : return "ACİL ACİL"
           case .fallingPrice : return "FİYATI DÜŞENLER"
           case . last48hours : return "SON 48 SAAT"
       }
    }
}
enum interestedSection: Int,CaseIterable,CustomStringConvertible{
    
    case title
       var description: String{
           switch self{
           case .title : return "İLGİLENEBİLECEĞİNİZ "
       }
    }
}
