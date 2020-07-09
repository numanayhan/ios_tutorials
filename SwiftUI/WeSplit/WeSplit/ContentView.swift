//
//  ContentView.swift
//  WeSplit
//
//  Created by TRA on 20.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TFView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

struct TFView: View {
     
    @State private var  check = ""
    
    var body: some View {
         
        Form{
            Section{
                TextField("Amount",text:$check)
                    .keyboardType(.decimalPad)
                
            }
        }
    }
}

struct FormsView: View {
    @State private var name = ""
    var body: some View {
         Form{
            TextField("Enter",text:$name)
            Text("T \(name)")
         }
    }
}
struct ButtonClickView: View {
    @State var tap = 0
    var body: some View {
        Button("Tap \(tap)"){
            self.tap  += 1
        }
    }
}
struct NavView: View {
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Text("Hello, World!")
                }
            }.navigationBarTitle(Text("Swift UI"),displayMode: .automatic)
        }
    }
}
struct FormView: View {
    var body: some View {
        Form{
            
            Section(header: Text("Important Tasks").font(.largeTitle)) {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Section{
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            // Max 10 Text
        }
    }
}
