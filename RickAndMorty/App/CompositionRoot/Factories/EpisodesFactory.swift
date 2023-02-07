//
//  EpisodesFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

protocol EpisodesFactory {
    func makeModule() -> UIViewController
}

struct EpisodesFactoryImp: EpisodesFactory {
    private(set) var urlEpisodes: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let controller = EpisodesViewController()
        controller.title = "Episodes"
        return controller
    }
}
