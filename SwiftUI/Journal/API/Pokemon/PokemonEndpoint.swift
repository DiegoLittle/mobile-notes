//
//  PokemonEndpoint.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
enum PokemonEndpoint {
    case pokemonList
}

extension PokemonEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .pokemonList:
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
