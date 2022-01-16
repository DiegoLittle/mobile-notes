//
//  PokemonListAPIResponse.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation

struct PokemonListAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonListItem]
}
