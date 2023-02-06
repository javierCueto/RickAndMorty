//
//  LocationsRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol LocationsRepository {
    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location])
}
