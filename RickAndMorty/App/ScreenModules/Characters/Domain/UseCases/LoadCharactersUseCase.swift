//
//  LoadCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

protocol LoadCharactersUseCase {
    func execute() async -> Result<[Character], Error>
}

final class LoadCharactersUseCaseImp: LoadCharactersUseCase {
    
    private let characterRepository: CharactersRepository
    private var url: String
    private var result: (info: Info, characters: [Character])?
    
    init(characterRepository: CharactersRepository, url: String){
        self.characterRepository = characterRepository
        self.url = url
    }
    
    func execute() async -> Result<[Character], Error> {
        guard !url.isEmpty else { return .success([]) }
        do {
            let repositoryResult = try await characterRepository.fetchCharacters(urlList: url)
            url = repositoryResult.info.next ?? .empty
            return .success(repositoryResult.character)
        }catch {
            return .failure(error)
        }
    }
}
