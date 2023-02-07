//
//  ResultEpisodesDTO.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

struct ResultEpisodesDTO: Decodable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
