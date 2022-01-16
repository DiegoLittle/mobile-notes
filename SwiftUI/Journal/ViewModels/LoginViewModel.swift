//
//  LoginViewModel.swift
//  Journal
//
//  Created by Diego Little on 11/30/21.
//

import Foundation

struct LoginResponse: Codable {
    var access_token: String
}

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    
    var loginDisabled: Bool{
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (String) -> Void){
        let url = URL(string: "http://127.0.0.1:5000/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: ""),
            URLQueryItem(name: "username", value: credentials.email),
            URLQueryItem(name: "password", value: credentials.password),
            URLQueryItem(name: "scope", value: ""),
            URLQueryItem(name: "client_id", value: ""),
            URLQueryItem(name: "client_secret", value: ""),
            
        ]
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                print ("server error")
                return
            }
            if (response.mimeType == "application/json"){
    
                guard let data = data else{return}
//                var responseString = String(data:data, encoding: .utf8)
                let decoder = JSONDecoder()
                guard let LoginResponse = try? decoder.decode(LoginResponse.self, from:data) else{
                    print("Error Decoding JSON")
                    return
                }                
                let token = LoginResponse.access_token
                UserDefaults.standard.setValue(token,forKey:"access_token")
//                let dataString = String(data: data, encoding: .utf8) {
                completion(token)
            }

        }
        task.resume()
        
    }
}
