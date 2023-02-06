//
//  CharacterDetailRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol CharacterDetailRepository {
    func fetchCharacterDetail(urlDetail: String) async throws -> Character
}
