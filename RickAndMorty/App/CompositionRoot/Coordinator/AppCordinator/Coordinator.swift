//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
