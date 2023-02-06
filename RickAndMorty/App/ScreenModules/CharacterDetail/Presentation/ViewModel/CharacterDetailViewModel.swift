//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import Foundation
import Combine

protocol CharacterDetailViewModel: BaseViewModel {
    var nameCharacter: String { get }
    var status: String { get }
    var specie: String { get }
    var imageData: Data? { get }
    var origin: String { get }
    var location: String { get }
}

final class CharacterDetailViewModelImp: CharacterDetailViewModel {
    
    // MARK: - Internal properties
    var state: PassthroughSubject<StateController, Never>
    
    var nameCharacter: String {
        character?.name ?? .empty
    }
    
    var status: String {
        character?.status?.description ?? .empty
    }
    
    var specie: String {
        character?.specie.description ?? .empty
    }
    
    var imageData: Data? {
        dataImageUseCase.getDataFromCache(url: character?.urlImage)
    }
    
    var origin: String {
        character?.origin.name ?? .empty
    }
    
    var location: String {
        character?.location.name ?? .empty
    }
    
    // MARK: - Private properties
    private let loadCharacterDetailUseCase: LoadCharacterDetailUseCase
    private let dataImageUseCase: ImageDataUseCase
    private var character: Character?
    
    init(
        state: PassthroughSubject<StateController, Never>,
        loadCharacterDetailUseCase: LoadCharacterDetailUseCase,
        dataImageUseCase: ImageDataUseCase
    ) {
        self.state = state
        self.loadCharacterDetailUseCase = loadCharacterDetailUseCase
        self.dataImageUseCase = dataImageUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            do {
                let characterResult = try await loadCharacterDetailUseCase.execute()
                character = characterResult
                state.send(.success)
            }catch {
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }
    
    
}
