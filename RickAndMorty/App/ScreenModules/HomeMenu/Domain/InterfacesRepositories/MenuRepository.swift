//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
