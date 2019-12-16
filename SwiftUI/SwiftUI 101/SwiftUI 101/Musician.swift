//
//  Musician.swift
//  SwiftUI 101
//
//  Created by TRA on 13.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
struct Musicion:Identifiable {
      var id = UUID()
      var genre : String
      var bands : [String]
      
}

let rock = Musicion(genre: "Rock", bands: ["Deep Purple", "Led Zeppelin", "Pink Floyd"])

let metal = Musicion(genre: "Metal", bands: ["Metallica","Megadeth","Iron Maiden"])

let pop = Musicion(genre: "Pop", bands: ["Madonnda","Rihanna","Beyonce"])

let musicianArray = [rock, metal, pop]
