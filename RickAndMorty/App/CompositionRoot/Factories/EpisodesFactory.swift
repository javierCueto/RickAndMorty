//
//  EpisodesFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit
import Combine

protocol EpisodesFactory {
    func makeModule() -> UIViewController
}

struct EpisodesFactoryImp: EpisodesFactory {
    private(set) var urlEpisodes: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let episodesRepository = EpisodesRepositoryImp(
            remoteService: appContainer.apiClient)
        let loadEpisodesUseCase = LoadEpisodesUseCaseImp(episodesRepository: episodesRepository, urlEpisodes: urlEpisodes)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = EpisodesViewModelImp(
            state: state,
            loadEpisodesUseCase: loadEpisodesUseCase,
            lastPageValidationUseCase: lastPageValidationUseCase )
        
        let controller = EpisodesViewController(viewModel: viewModel)
        controller.title = "Episodes"
        return controller
    }
}
