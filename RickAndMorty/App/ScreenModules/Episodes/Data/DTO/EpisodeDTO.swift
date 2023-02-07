//
//  EpisodeDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
}
