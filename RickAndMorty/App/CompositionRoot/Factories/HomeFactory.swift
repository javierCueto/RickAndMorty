//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            viewModel: homeMenuViewModel,
            layout: makeLayout(), coordinator: coordinator)
        homeMenuController.title = AppLocalized.appName
        return homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding )
        / ViewValues.multiplierTwo
        let layoutHeight = (ViewValues.widthScreen  - ViewValues.doublePadding )
        / ViewValues.multiplierTwo
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalPadding,
            bottom: .zero,
            right: ViewValues.normalPadding)
        return layout
    }
}
