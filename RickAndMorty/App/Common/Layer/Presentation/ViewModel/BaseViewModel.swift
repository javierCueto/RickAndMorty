//
//  BaseViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

import Combine

protocol BaseViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    func viewDidLoad()
}
