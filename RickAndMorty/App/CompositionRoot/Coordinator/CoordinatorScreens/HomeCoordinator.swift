//
//  HomeCoordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory){
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        //TODO: Use a enum or a struct to avoid string directly
        switch model.title {
        case "characters":
            goToCharacters(urlList: model.url)
        case "episodes":
            goToEpisodes(urlEpisodes: model.url)
        case "locations":
            goToLocations(urlLocations: model.url)
        default:
            break
        }
    }
    
    private func goToCharacters(urlList: String) {
        let characterCoordinator =  homeFactory.makeCharactersCoordinator(
            navigation: navigation,
            urlList: urlList)
        characterCoordinator.start()
    }
    
    private func goToLocations(urlLocations: String) {
        let locationsCoordinator = homeFactory
            .makeLocationsCoordinator(
                navigation: navigation,
                urlLocations: urlLocations)
        
        locationsCoordinator.start()
    }
    
    private func goToEpisodes(urlEpisodes: String) {
        let episodesCoordinator = homeFactory
            .makeEpisodesCoordinator(
                navigation: navigation,
                urlEpisodes: urlEpisodes)
        
        episodesCoordinator.start()
    }
}
