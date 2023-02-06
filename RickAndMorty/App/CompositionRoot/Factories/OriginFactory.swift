//
//  OriginFactory.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

protocol OriginFactory {
    func makeModule() -> UIViewController
}

struct OriginFactoryImp: OriginFactory {
    func makeModule() -> UIViewController {
        let controller = OriginViewController()
        controller.title = "Origin"
        return controller
    }
}
