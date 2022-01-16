//
//  LoginView.swift
//  Journal
//
//  Created by Diego Little on 11/30/21.
//

import SwiftUI

struct LoginView: View{
    @ObservedObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View{
        VStack(spacing:50){
            Text("Sign In").font(.title)
            TextField("Email", text: $loginViewModel.credentials.email);
            SecureField("Password", text: $loginViewModel.credentials.password)
            Button("Sign In"){
                loginViewModel.login{ (response) in
                    if(response.isEmpty){
                        print(response)
                    }
                    else{
                        print(response)
                        authentication.updateValidation(success: true)
                    }
                    
                }
            }
        }
        .padding()
        .background(Color.blue
                        .opacity(0.1))
        .cornerRadius(15)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
