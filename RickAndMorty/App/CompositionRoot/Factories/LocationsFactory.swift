//
//  LocationsFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit
import Combine

protocol LocationsFactory {
    func makeModule() -> UIViewController
}

struct LocationsFactoryImp: LocationsFactory {
    private(set) var urlLocations: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let locationsRepository = LocationsRepositoryImp(
            remoteService: appContainer.apiClient)
        let loadLocationsUseCase = LoadLocationsUseCaseImp(
            locationsRepository: locationsRepository,
            urlLocations: urlLocations)
        let lastPageUseCase = LastPageValidationUseCaseImp()
        let viewModel = LocationViewModelImp(
            state: state,
            loadLocationUseCase: loadLocationsUseCase,
            lastPageUseCase: lastPageUseCase)
        let controller = LocationsViewController(viewModel: viewModel)
        controller.title = AppLocalized.locations
        return controller
    }
}
