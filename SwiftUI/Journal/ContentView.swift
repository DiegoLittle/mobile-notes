//
//  ContentView.swift
//  Journal
//
//  Created by Diego Little on 10/14/21.
//

import SwiftUI


struct ContentView: View {
    var text="Test"
    var body: some View{
        TabView{

            NoteListView()
                .tabItem{
                    Image(systemName: "note.text")
                }
            Text("Medication")
                .tabItem{
                    Image(systemName: "pills")
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


