//
//  ResultEpisodesDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

extension ResultEpisodesDTO {
    func toDomain() -> (info: Info, episodes: [Episode]) {
        let info = Info(next: info.next)
        let episodes = results.map {
            Episode(
                id: $0.id,
                name: $0.name,
                airDate: $0.airDate,
                episode: $0.episode)
        }
        
        return (info: info, episodes: episodes)
    }
}
