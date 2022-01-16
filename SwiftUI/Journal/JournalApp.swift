//
//  JournalApp.swift
//  Journal
//
//  Created by Diego Little on 10/14/21.
//

import SwiftUI

@main
struct JournalApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authentication)
//            if authentication.isValidated{
//                ContentView()
//                    .environmentObject(authentication)
//            }
//            else{
//                LoginView()
//                    .environmentObject(authentication)
//
//            }
        }
    }
}
