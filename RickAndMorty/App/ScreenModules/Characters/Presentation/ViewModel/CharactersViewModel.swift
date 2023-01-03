//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

import Combine

protocol CharactersViewModel: BaseViewModel {
    var itemCharactersCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel
    func getUrlList(row: Int) -> String
}

final class CharactersViewModelImp: CharactersViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var lastPage: Bool = false
    
    var itemCharactersCount: Int {
        characters.count
    }
    
    private var characters: [Character] = []
    private let loadCharactersUseCase: LoadCharactersUseCase
    
    init(
        loadCharactersUseCase: LoadCharactersUseCase,
        state: PassthroughSubject<StateController, Never>
    ) {
        self.loadCharactersUseCase = loadCharactersUseCase
        self.state = state
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
           await loadCharactersUseCase()
        }
    }
    
    private func loadCharactersUseCase() async{
        let resultUseCase = await loadCharactersUseCase.execute()
        updateStateUI(resultUseCase: resultUseCase)
    }
    
    private func updateStateUI(resultUseCase: Result<[Character], Error>) {
        switch resultUseCase {
        case .success(let charactersArray):
            characters.append(contentsOf: charactersArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel {
        let character = characters[row]
        let itemCharacterViewModel = ItemCharacterViewModel(character: character)
        return itemCharacterViewModel
    }
    
    func getUrlList(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
    
    
}
