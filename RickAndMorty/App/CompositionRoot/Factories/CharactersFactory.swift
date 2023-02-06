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
    func makeCharacterDetailCoordinator(navigation: UINavigationController, urlDetail: String) -> Coordinator
}

struct CharactersFactoryImp: CharactersFactory {
    
    let urlList: String
    let appContainer: AppContainer
    
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = appContainer.apiClient
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharactersUseCase = LoadCharactersUseCaseImp(characterRepository: characterRepository, url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharactersViewModelImp(
            loadCharactersUseCase: loadCharactersUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase, imageDataUseCase: appContainer.getDatsImageUseCase())
        let controller = CharactersViewController(
            viewModel: viewModel,
            coordinator: coordinator)
        controller.title = "Characters"
        return controller
    }
    
    func makeCharacterDetailCoordinator(
        navigation: UINavigationController,
        urlDetail: String
    ) -> Coordinator {
        let characterDetailFactory = CharacterDetailFactoryImp(
            urlDetail: urlDetail, appContainer: appContainer)
        let characterDetailCoordinator = CharacterDetailCoordinator(
            navigation: navigation,
            characterDetailFactory: characterDetailFactory)
        return characterDetailCoordinator
    }
}
