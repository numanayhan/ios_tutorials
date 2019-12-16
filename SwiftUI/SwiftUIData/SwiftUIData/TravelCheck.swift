//
//  TravelCheck.swift
//  SwiftUIData
//
//  Created by TRA on 13.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import Foundation
import SwiftUI

struct TravelCheck:Identifiable {
    var id = UUID()
    var name : String
    var description:String
}
var travelCheck1 = TravelCheck(name: "Istanbul", description: "1453")
var travelCheck2 = TravelCheck(name: "Paris", description: "1850")

var travels = [travelCheck1,travelCheck2]


