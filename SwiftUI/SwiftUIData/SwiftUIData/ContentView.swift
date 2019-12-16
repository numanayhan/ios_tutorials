//
//  ContentView.swift
//  SwiftUIData
//
//  Created by TRA on 13.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var carakter = "TEST"
    @State var show  = false
    
    var body: some View {
        VStack{
            Text("İlk Sayfa").padding()
            Button(action: {
                //
                
            }) {
                Text("Next")
                    .foregroundColor(Color.black)
                    .font(.largeTitle)
            }.sheet(isPresented:$show) { () -> Detail in
                
                return Detail()
            }
        }
        
//        NavigationView{
//        List(travels){travel in
//
//            NavigationLink(destination:  Detail(name: travel)) {
//                 Text(travel.name)
//            }
//            }
//        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
