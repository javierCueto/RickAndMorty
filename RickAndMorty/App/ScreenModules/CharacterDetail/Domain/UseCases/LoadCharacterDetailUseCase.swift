//
//  LoadCharacterDetailUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol LoadCharacterDetailUseCase {
    func execute() async throws -> Character
}

struct LoadCharacterDetailUseCaseImp: LoadCharacterDetailUseCase {
    private(set) var characterDetailRepository: CharacterDetailRepository
    private(set) var urlDetail: String
    
    func execute() async throws -> Character {
        try await characterDetailRepository.fetchCharacterDetail(urlDetail: urlDetail)
    }

}
