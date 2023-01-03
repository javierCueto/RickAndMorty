//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

protocol CharactersRepository {
    func fetchCharacters(
        urlList: String
    ) async throws -> (info: Info, character:[Character])
}
