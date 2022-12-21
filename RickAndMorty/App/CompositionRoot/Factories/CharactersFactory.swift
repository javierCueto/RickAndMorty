//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 20/12/22.
//

import UIKit

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let controller = CharactersViewController()
        controller.title = "Characters"
        return controller
    }
}
