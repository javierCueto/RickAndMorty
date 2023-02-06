//
//  CharacterDetailRepositoryImp.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import Foundation

struct CharacterDetailRepositoryImp: CharacterDetailRepository {
    private(set) var remoteService: ApiClientService
    
    func fetchCharacterDetail(urlDetail: String) async throws -> Character {
        let url = URL(string: urlDetail)
        let result = try await remoteService.request(
            url: url,
            type: CharacterDTO.self)
        return result.toDomain()
    }
}
