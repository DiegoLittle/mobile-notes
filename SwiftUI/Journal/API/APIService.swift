//
//  APIService.swift
//  Journal
//
//  Created by Diego Little on 11/26/21.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
