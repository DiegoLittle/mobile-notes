//
//  EventsEndpoint.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Combine

protocol NoteService {
    var apiSession: APIService {get}
    
    func getNoteList() -> AnyPublisher<[NoteListItem], APIError>
}

extension NoteService {
    
    func getNoteList() -> AnyPublisher<[NoteListItem], APIError> {
//        Request builder for pokemon endpoint url passed to apiSession request
        return apiSession.request(with: NoteEndpoint.getNoteList)
            .eraseToAnyPublisher()
    }
    
}
