//
//  ItemEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 07/02/23.
//

struct ItemEpisodeViewModel {
    private(set) var episode: Episode
    
    var numberEpisode: String {
        "# \(episode.id)"
    }
    
    var name: String {
        episode.name
    }
    
    var airDate: String {
        episode.airDate
    }
    
    var seasonAndEpisode: String {
        episode.episode
    }
}
