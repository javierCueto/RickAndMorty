//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule() -> UIViewController {
        var homeMenuController = HomeMenuController()
        homeMenuController.title = "Rick And Morty"
        return homeMenuController
    }
}
