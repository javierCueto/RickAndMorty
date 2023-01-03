//
//  LocationDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

struct LocationDTO: Decodable {
    let name: String
    let type: String?
    let dimension: String?
    let url: String
}
