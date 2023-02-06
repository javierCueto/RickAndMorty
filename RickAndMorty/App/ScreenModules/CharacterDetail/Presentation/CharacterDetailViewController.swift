//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

protocol CharacterDetailViewControllerCoordinator {
    
}

final class CharacterDetailViewController: UIViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUserInterface()
    }
    
    // MARK: - Helpers
    
    // MARK: - Actions
    func configUserInterface() {
        view.backgroundColor = .systemBackground
    }
    
}

// MARK: - Extensions here
