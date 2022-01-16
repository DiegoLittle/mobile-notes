//
//  NoteListViewModel.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Combine
import SwiftUI
import Alamofire
//
class NoteListViewModel: ObservableObject, NoteService {

    var apiSession: APIService
    @Published var noteList = [NoteListItem]()

    var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func getNoteList() {
//        self.getPokemonList is an APISession request to the pokemonList URL which returns an AnyPublisher that has the sink defined below
        let cancellable = self.getNoteList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }

            }) { (note) in
                self.noteList = note
        }
        cancellables.insert(cancellable)
    }
    func getNotes(){
        let token: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
        let parameters = ["access_token": token]
        AF.request("http://127.0.0.1:5000/user/notes",method: .get, parameters: parameters)
            .responseJSON
        { response in
            switch response.result {
            case .success(let data):
                let json = try! JSONSerialization.data(withJSONObject: data)
                let decoder = JSONDecoder()
                guard let results = try? decoder.decode([NoteListItem].self, from: json) else {
                    print("Error decoding result to JSON")
                    return }
                self.noteList = results
//                print(String(data: json, encoding: .utf8)!)
            case .failure(let error):
                print("Source of randomness failed: \(error)")
            }
        }
    }
    func deleteNote(at offsets: IndexSet){
        guard let index = Array(offsets).first else { return }
        let token: String = UserDefaults.standard.string(forKey: "access_token") ?? ""
        let encoder = JSONEncoder()
        let note = self.noteList[index]
        self.noteList.remove(at: index)
        let jsonNote = try! encoder.encode(note);
        let access_token = ["access_token": token]
        let parameters = ["token":access_token,"note":String(data:jsonNote,encoding: .utf8)!] as [String : Any]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: parameters)
        let url = URL(string: "http://127.0.0.1:5000/user/notes")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = finalBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            print(String(data: data!, encoding: .utf8)!)
            print(response)
//            print(json)
//            print(String(data: data ?? "" , encoding: .utf8)!)
        }.resume()
    }
}
