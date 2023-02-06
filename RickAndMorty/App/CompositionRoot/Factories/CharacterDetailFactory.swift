//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

protocol CharacterDetailFactory {
    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController
}

struct CharacterDetailFactoryImp: CharacterDetailFactory {
    let urlDetail: String
    let appContainer: AppContainer
    
    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController {
        let controller = CharacterDetailViewController()
        return controller
    }
}
