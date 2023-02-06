//
//  LocationsFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

protocol LocationsFactory {
    func makeModule() -> UIViewController
}

struct LocationsFactoryImp: LocationsFactory {
    private(set) var urlLocations: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let controller = LocationsViewController()
        controller.title = AppLocalized.locations
        return controller
    }
}
