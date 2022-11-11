//
//  AppFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}


struct AppFactoryImp: AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp()
        let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
        return homeCoordinator
    }
}
