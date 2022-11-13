//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
