//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

final class LocationsCoordinator: Coordinator {
    private let locationsFactory: LocationsFactory
    var navigation: UINavigationController
    
    init(
        locationsFactory: LocationsFactory,
        navigation: UINavigationController
    ) {
        self.locationsFactory = locationsFactory
        self.navigation = navigation
    }
    
    func start() {
        let controller = locationsFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
}
