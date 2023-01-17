//
//  RemoteImageDataService.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

import Foundation

protocol RemoteImageDataService {
    func request(url: URL?) async -> Data?
}
