//
//  ContentView.swift
//  SwiftUI 101
//
//  Created by TRA on 13.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let myArray = ["James", "Lars", "Kirk", "Rob"]

    var body: some View {
       List {
                   
                   ForEach(musicianArray) { musician in
                       Section(header: Text(musician.genre)) {
                           ForEach(musician.bands, id: \.self) { band in
                               Text(band)
                           }
                       }
                   }
                   
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
