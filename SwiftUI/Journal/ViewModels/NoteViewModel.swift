//
//  NoteViewModel.swift
//  Journal
//
//  Created by Diego Little on 11/20/21.
//

import Foundation
import Alamofire


class NoteViewModel: ObservableObject{

    @Published var note:NoteListItem;
    
    
    init(_ note: NoteListItem = NoteListItem(id: UUID(), title: "", description: "")){
        self.note = note;
    }
//    @Published var title = "";
//    @Published var body = "";
    
    func postNote() {
        let token: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
        let encoder = JSONEncoder()
        let jsonNote = try! encoder.encode(note);
        let access_token = ["access_token": token]
        let parameters = ["token":access_token,"note":String(data:jsonNote,encoding: .utf8)!] as [String : Any]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: parameters)
        let url = URL(string: "http://127.0.0.1:5000/user/notes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in            
//            print(response)
//            print(String(data: data, encoding: .utf8)!)
        }.resume()
        print(parameters)
        print()
    }
    
}
