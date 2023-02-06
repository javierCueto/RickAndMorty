//
//  LocationCoordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

final class LocationDetailCoordinator: Coordinator {
    private var locationDetailFactory: LocationDetailFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, locationDetailFactory: LocationDetailFactory) {
        self.navigation = navigation
        self.locationDetailFactory = locationDetailFactory
    }
    
    func start() {
        let controller = locationDetailFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
}

