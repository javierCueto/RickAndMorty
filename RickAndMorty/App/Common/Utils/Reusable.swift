//
//  Reusable.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}

