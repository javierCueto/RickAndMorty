//
//  LoadLocationsUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol LoadLocationsUseCase {
    mutating func execute() async -> Result<[Location], Error>
}

struct LoadLocationsUseCaseImp: LoadLocationsUseCase {
    private(set) var locationsRepository: LocationsRepository
    private(set) var urlLocations: String
    
    mutating func execute() async -> Result<[Location], Error> {
        guard !urlLocations.isEmpty else { return .success([])}

        do {
            let result = try await locationsRepository
                .fetchLocations(urlLocations: urlLocations)
            urlLocations = result.info.next ?? .empty
            return .success(result.locations)
        }catch {
            return .failure(error)
        }
    }
}
