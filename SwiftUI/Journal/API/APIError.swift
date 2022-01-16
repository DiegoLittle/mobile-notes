//
//  APIError.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
