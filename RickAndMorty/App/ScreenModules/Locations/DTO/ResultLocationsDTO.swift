//
//  ResultLocationsDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

struct ResultLocationsDTO: Decodable {
    let info: InfoDTO
    let results: [LocationDTO]
}
