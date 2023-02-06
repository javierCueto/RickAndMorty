//
//  ImageDataRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

import Foundation

protocol ImageDataRepository {
    func fetchData(url: URL?) async -> Data?
    func getFromCache(url: String?) -> Data?
}
