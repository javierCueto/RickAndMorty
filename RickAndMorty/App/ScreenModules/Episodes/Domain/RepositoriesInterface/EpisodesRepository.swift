//
//  EpisodesRepository.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol EpisodesRepository {
    func fetch(urlEpisodes: String)
    async throws -> (info: Info, episodes: [Episode])
}
