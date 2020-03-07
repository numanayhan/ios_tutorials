//
//  ContentView.swift
 
//  SwiftUI 101
//
//  Created by TRA on 13.12.2019.
//  Copyright © 2019 panda. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
struct ContentView: View {
    @State var isSubscribed:Bool = false // ChangeButtonText
    var body:some View{
        VStack{
            ChangeButtonText(isSubscribed: $isSubscribed)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ChangeButtonText: View {
    @Binding var isSubscribed:Bool
    var body:some View{
        Button(action: {
            self.isSubscribed.toggle()
        }){
            Text(isSubscribed ? "UnSub":"Sub")
             
        }
    }
    
}
struct BasicAnimation: View {
    @State var isCircle:Bool = false
     var body:some View{
        Button(action: {
            self.isCircle.toggle()
        }){
            Color.blue
                .cornerRadius(isCircle ? 50 : 0)
                .animation(.default)
        }.frame(width: 200, height: 50, alignment: .center)
     }
    
}
struct TextView: View {

    var body:some View{
        HStack{
            Text("ice ").fontWeight(.heavy) +
        Text("cream")
        }
    }
    
}
struct ImageReSize: View {
   
    var body:some View{
        VStack(alignment: .leading) {
            Image("notify").resizable().edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke( LinearGradient.init(gradient: Gradient.init(colors: [.blue,.purple,.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                , lineWidth: 2))
        }
    }
}

struct EditListView: View {
  @State var flavors = ["Van","Straw","Choc"]
    var body:some View{
        NavigationView{
            List{
                ForEach(flavors , id: \.self){ flavorName in
                    Text(flavorName)
                }.onMove { (IndexSet, index) in
                    self.flavors.move(fromOffsets: IndexSet, toOffset: index)
                }
            }.navigationBarTitle("Flavors")
                .navigationBarItems(trailing: EditButton())
        }
    }
}

struct LinearGradientView: View {

    var body:some View{
        VStack(alignment: .leading) {
        LinearGradient.init(gradient: Gradient.init(colors: [.blue,.purple,.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            
        }
    }
}
struct ErrorPoint: View {

    var body:some View{
        NavigationView {
            Text("something error \(#function) , is line \(#line) is file \(#file)")
        }
        
    }
}
