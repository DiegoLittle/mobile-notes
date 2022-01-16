//
//  PokemonListViewModel.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Combine
import SwiftUI

class PokemonListViewModel: ObservableObject, PokemonService {
    var apiSession: APIService
    @Published var pokemon = [PokemonListItem]()
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getPokemonList() {
//        self.getPokemonList is an APISession request to the pokemonList URL which returns an AnyPublisher that has the sink defined below
        let cancellable = self.getPokemonList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (pokemon) in
                self.pokemon = pokemon.results
        }
        cancellables.insert(cancellable)
    }
}
