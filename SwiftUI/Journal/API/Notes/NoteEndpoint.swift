//
//  NotesEndpoint.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Alamofire

enum NoteEndpoint {
    case getNoteList
    case postNote
}
//https://jsonplaceholder.typicode.com/posts/1/comments
extension NoteEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getNoteList:

            guard let url = URL(string:"http://127.0.0.1:5000/user/items"
            )
                else {preconditionFailure("Invalid URL format")}
            var request = URLRequest(url: url)
            
            var requestBodyComponents = URLComponents()
//            requestBodyComponents.queryItems = [
//                URLQueryItem(name: "access_token", value: token),
//            ]
//            print(token)
            request.httpBody = requestBodyComponents.query?.data(using: .utf8)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            print(request)
            return request
        case .postNote:
            guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts/1/comments"
            )
                else {preconditionFailure("Invalid URL format")}
            var request = URLRequest(url: url)
            request.httpMethod="POST"
            return request
        }
        
    }
}
