//
//  PokemonService.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Combine

protocol PokemonService {
    var apiSession: APIService {get}
    
    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError>
}

extension PokemonService {
    
    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError> {
//        Request builder for pokemon endpoint url passed to apiSession request
        return apiSession.request(with: PokemonEndpoint.pokemonList)
            .eraseToAnyPublisher()
    }
}
