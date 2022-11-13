//
//  MenuRepositoryImp.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

import Foundation

struct MenuRepositoryImp: MenuRepository {
    
    let apiClientService: ApiClientService
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
    
}
