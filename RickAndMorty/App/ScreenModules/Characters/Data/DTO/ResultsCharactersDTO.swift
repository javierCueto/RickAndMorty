//
//  ResultsCharactersDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

struct ResultsCharactersDTO: Decodable {
    let results: [CharacterDTO]
    let info: InfoDTO
}
