//
//  Authentication.swift
//  Journal
//
//  Created by Diego Little on 11/30/21.
//
import SwiftUI

class Authentication: ObservableObject{
//    @StateObject var authentication = Authentication

    @Published var isValidated = false;
    
    func updateValidation(success:Bool){
        withAnimation{
            isValidated = success
        }
    }
}
