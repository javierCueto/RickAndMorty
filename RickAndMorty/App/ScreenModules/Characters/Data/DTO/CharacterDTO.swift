//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let image: String?
    let url: String
    let origin: OriginDTO
    let location: LocationDTO
}
