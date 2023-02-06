//
//  LocationsRepositoryImp.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import Foundation

struct LocationsRepositoryImp: LocationsRepository {
    private(set) var remoteService: ApiClientService
    
    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location]) {
        let url = URL(string: urlLocations)
        return try await remoteService
            .request(url: url, type: ResultLocationsDTO.self)
            .toDomain()
    }
}
