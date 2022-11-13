//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
