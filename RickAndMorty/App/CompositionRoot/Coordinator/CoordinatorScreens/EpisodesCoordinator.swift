//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

final class EpisodesCoordinator: Coordinator {
    private let episodesFactory: EpisodesFactory
    var navigation: UINavigationController
    
    init(
        episodesFactory: EpisodesFactory,
        navigation: UINavigationController
    ) {
        self.episodesFactory = episodesFactory
        self.navigation = navigation
    }
    
    func start() {
        let controller = episodesFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
}

