//
//  OriginCoordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

final class OriginCoordinator: Coordinator {
    private var originFactory: OriginFactory
    var navigation: UINavigationController
    
    init(navigation: UINavigationController, originFactory: OriginFactory) {
        self.navigation = navigation
        self.originFactory = originFactory
    }
    
    func start() {
        let controller = originFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
}
