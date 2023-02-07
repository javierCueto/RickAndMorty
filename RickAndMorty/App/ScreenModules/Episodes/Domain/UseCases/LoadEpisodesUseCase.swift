//
//  LoadEpisodesUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

protocol LoadEpisodesUseCase {
    mutating func getEpisodes() async -> Result<[Episode], Error>
}

struct LoadEpisodesUseCaseImp: LoadEpisodesUseCase {
    private(set) var episodesRepository: EpisodesRepository
    private(set) var urlEpisodes: String
    
    mutating func getEpisodes() async -> Result<[Episode], Error> {
        guard !urlEpisodes.isEmpty else { return .success([])}
        do {
            let result = try await episodesRepository
                .fetch(urlEpisodes: urlEpisodes)
            urlEpisodes = result.info.next ?? .empty
            return .success(result.episodes)
        }catch {
            return .failure(error)
        }
    }
}
