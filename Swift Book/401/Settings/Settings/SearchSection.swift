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
    case emergency
    case interested
    case near
    case lastSearch
    case lastVisit 
    var description: String{
        switch self{
          case .categories : return " ARAMA"
          case .emergency : return "ACİL"
          case .interested : return "İLGİLENEBİLECEĞİNİZ İLANLAR"
          case .near : return "YAKININIZDAKİ ALIŞVERİŞ İLANLARI"
          case .lastSearch : return "SON ARAMANIZA UYGUN İLANLAR"
          case .lastVisit : return "SON GEZDİĞİNİZ İLANLAR"
        }
    }
    
}
