//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit
import Combine

protocol CharacterDetailFactory {
    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController
}

struct CharacterDetailFactoryImp: CharacterDetailFactory {
    let urlDetail: String
    let appContainer: AppContainer
    
    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let characterDetailRepository = CharacterDetailRepositoryImp(
            remoteService: appContainer.apiClient)
        let loadCharacterDetailUseCase = LoadCharacterDetailUseCaseImp(
            characterDetailRepository: characterDetailRepository,
            urlDetail: urlDetail)
        let viewModel = CharacterDetailViewModelImp(
            state: state,
            loadCharacterDetailUseCase:
                loadCharacterDetailUseCase,
            dataImageUseCase: appContainer.getDatsImageUseCase())
        let controller = CharacterDetailViewController(
            viewModel: viewModel,
            coordinator: coordinator)
        return controller
    }
}
