//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 20/12/22.
//

import UIKit
import Combine

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharactersFactory {
    let urlList: String
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = ApiClientServiceImp()
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharactersUseCase = LoadCharactersUseCaseImp(characterRepository: characterRepository, url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharactersViewModelImp(
            loadCharactersUseCase: loadCharactersUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase)
        let controller = CharactersViewController(viewModel: viewModel)
        controller.title = "Characters"
        return controller
    }
}
